SELECT * from salary_payroll where sign_subject is null and delete_flag = 0 ;

SELECT auth_applet from salary_payroll_detail where id= 1558089796766629938;

SELECT *  FROM salary_payroll_detail
WHERE import_batch = 1558506331880521788;

SELECT * from salary_payroll where project_no = '989543343093399607';

SELECT * from salary_payroll where sign_subject_id = 1370709067308404700;
select * from salary_payroll where id = 1558264261724213280;
select * from salary_payroll_detail where  payroll_id = 1558264261724213280;

SELECT * from salary_payroll where  cont_code = 'GB-2609280005';

-- 1370709067308404804
-- 1370709067308404700

UPDATE `jy-salary`.`salary_payroll`
SET `sign_subject_id` = 1370709067308404804
WHERE `id` = 1558264261724213280;

SELECT
    id,
    cont_id,
    cont_code,
    sign_subject_id,
    sign_subject,
    create_time,
    update_time,
    delete_flag
FROM `jy-salary`.`salary_payroll`
WHERE
    update_time >= '2026-09-21 00:00:00'
  AND delete_flag = 0
  AND (
    CAST(sign_subject_id AS CHAR) LIKE '%00'
        AND CAST(cont_id AS CHAR) LIKE '%00'
    )
ORDER BY create_time DESC;