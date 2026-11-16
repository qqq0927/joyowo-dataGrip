-- 工资模板字段调整. 在 jy-salary 数据库中单独执行, 不与其他字段配置迁移并发运行.
-- retro_base 业务列已存在, 本脚本仅补充真实字段元数据及模板关联, 可重复执行.
START TRANSACTION;

INSERT INTO `jy-salary`.salary_incr_field
(id, field_name, field_code, field_type, is_common, conf_type, input_type, input_way,
 required_type, remark, create_time, create_staff_id, update_time, update_staff_id)
SELECT COALESCE(MAX(id), 0) + 1, '公积金补基', 'retro_base', 'work', 0, 'display', 'input', 'input',
       'optional', '', NOW(), -1, NOW(), -1
FROM `jy-salary`.salary_incr_field
HAVING NOT EXISTS (
    SELECT 1 FROM `jy-salary`.salary_incr_field WHERE field_code = 'retro_base'
);

SET @retro_base_field_id = (
    SELECT MIN(id) FROM `jy-salary`.salary_incr_field WHERE field_code = 'retro_base'
);

UPDATE `jy-salary`.salary_incr_field
SET field_name = '公积金补基', field_type = 'work', is_common = 0, conf_type = 'display',
    input_type = 'input', input_way = 'input', required_type = 'optional',
    update_time = NOW(), update_staff_id = -1
WHERE id = @retro_base_field_id;

SET @next_pay_ref_id = (
    SELECT COALESCE(MAX(id), 0) FROM `jy-salary`.salary_incr_field_resident_pay_ref
);

INSERT INTO `jy-salary`.salary_incr_field_resident_pay_ref
(id, salary_incr_field_id, pay_type, resident, formula_code, formula_note, formula, is_formula,
 create_time, create_staff_id, update_time, update_staff_id)
SELECT (@next_pay_ref_id := @next_pay_ref_id + 1), @retro_base_field_id,
       target.pay_type, target.resident, '', '允许正负数, 最多两位小数', '', 0, NOW(), -1, NOW(), -1
FROM (SELECT 2 AS pay_type, 1 AS resident UNION ALL SELECT 3, 0 UNION ALL SELECT 3, 1) target
WHERE NOT EXISTS (
    SELECT 1 FROM `jy-salary`.salary_incr_field_resident_pay_ref existing
    WHERE existing.salary_incr_field_id = @retro_base_field_id
      AND existing.pay_type = target.pay_type AND existing.resident = target.resident
);

UPDATE `jy-salary`.salary_incr_field_resident_pay_ref
SET formula_code = '', formula = '', is_formula = 0,
    formula_note = '允许正负数, 最多两位小数', update_time = NOW(), update_staff_id = -1
WHERE salary_incr_field_id = @retro_base_field_id
  AND (pay_type = 3 OR (pay_type = 2 AND resident = 1));

SET @next_template_ref_id = (
    SELECT COALESCE(MAX(id), 0) FROM `jy-salary`.salary_incr_template_field_ref
);

-- 新关联默认非必填, 已有关联的 required 配置保持不变.
INSERT INTO `jy-salary`.salary_incr_template_field_ref
(id, salary_incr_template_id, salary_incr_field_id, sequence, required,
 create_time, create_staff_id, update_time, update_staff_id)
SELECT (@next_template_ref_id := @next_template_ref_id + 1), template.id, @retro_base_field_id,
       COALESCE((SELECT MAX(existing.sequence) FROM `jy-salary`.salary_incr_template_field_ref existing
                 WHERE existing.salary_incr_template_id = template.id), 0) + 1,
       0, NOW(), -1, NOW(), -1
FROM `jy-salary`.salary_incr_template template
WHERE (template.pay_type = 3 OR (template.pay_type = 2 AND template.resident = 1))
  AND NOT EXISTS (
    SELECT 1 FROM `jy-salary`.salary_incr_template_field_ref existing
    WHERE existing.salary_incr_template_id = template.id
      AND existing.salary_incr_field_id = @retro_base_field_id
);

UPDATE `jy-salary`.salary_incr_field
SET input_way = 'input', required_type = 'not_required', update_time = NOW(), update_staff_id = -1
WHERE field_code IN ('come_to_china_time', 'leave_china_time');

UPDATE `jy-salary`.salary_incr_template_field_ref template_ref
    INNER JOIN `jy-salary`.salary_incr_field field ON field.id = template_ref.salary_incr_field_id
SET template_ref.required = 0, template_ref.update_time = NOW(), template_ref.update_staff_id = -1
WHERE field.field_code IN ('come_to_china_time', 'leave_china_time');

COMMIT;

-- 发布应用前执行本脚本. 应用使用新版本详情缓存键, 旧详情缓存不会影响新字段配置.
-- 已运行新版本应用时再执行脚本, 需要清理模板详情缓存及模板公式缓存后重新读取.


SELECT
    id,
    template_name,
    pay_type,
    resident,
    status
FROM `jy-salary`.salary_incr_template
WHERE id IN (1, 2, 5);

SELECT
    f.id AS field_id,
    f.field_name,
    f.required_type,
    t.id AS template_id,
    t.template_name,
    r.required AS template_required,
    CASE
        WHEN r.id IS NULL THEN '未关联模板'
        WHEN f.required_type = 'required' THEN '必填'
        WHEN f.required_type = 'not_required' THEN '非必填'
        WHEN f.required_type = 'conditional' THEN '条件必填'
        WHEN r.required = 1 THEN '必填'
        WHEN r.required = 0 THEN '非必填'
        ELSE '未配置'
        END AS required_description
FROM `jy-salary`.salary_incr_field f
         LEFT JOIN `jy-salary`.salary_incr_template_field_ref r
                   ON r.salary_incr_field_id = f.id
         LEFT JOIN `jy-salary`.salary_incr_template t
                   ON t.id = r.salary_incr_template_id
WHERE f.field_code = 'three_ins_zero_explain'
ORDER BY t.id, f.id;