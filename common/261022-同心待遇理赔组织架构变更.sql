DELETE FROM `benefit-claim`.a_temp_staff_org_info;

-- 2. benefit-claim
INSERT INTO `benefit-claim`.a_temp_staff_org_info (
    id, staff_id, name, staff_code,
    old_org_id, old_org_name,
    l1_id, l1_name,
    l2_id, l2_name,
    l3_id, l3_name,
    l4_id, l4_name,
    l5_id, l5_name,
    org_id, org_name
) VALUES (
             1, 1498254996141330490, '冯佩芳', NULL,
             1359975450611748926, '江西心同行同企业管理有限公司/集团大区/四区/杭州分公司/服务二部',
             NULL, '公共事业二部',
             NULL, '商务二部',
             NULL, '客户成功一部',
             1554916361239773295, '四组',
             NULL, NULL,
             1554916361239773295, '江西心同行同企业管理有限公司/公共事业二部/商务二部/客户成功一部/四组'
         );


-- 待遇理赔
UPDATE `benefit-claim`.claim_request cr
    INNER JOIN `benefit-claim`.a_temp_staff_org_info so
    ON cr.create_staff_id = so.staff_id
        AND cr.create_staff_department_id = so.old_org_id
SET cr.create_staff_department_id = so.org_id,
    cr.create_staff_department_name = so.org_name
WHERE so.staff_id IS NOT NULL;

UPDATE `benefit-claim`.outsourcing_fee_deduction ofd
    INNER JOIN `benefit-claim`.a_temp_staff_org_info so
    ON ofd.create_staff_id = so.staff_id
        AND ofd.create_staff_department_id = so.old_org_id
SET ofd.create_staff_department_id = so.org_id,
    ofd.create_staff_department_name = so.org_name
WHERE so.staff_id IS NOT NULL;

UPDATE `benefit-claim`.disbursement d
    INNER JOIN `benefit-claim`.a_temp_staff_org_info so
    ON d.create_staff_id = so.staff_id
        AND d.create_staff_department_id = so.old_org_id
SET d.create_staff_department_id = so.org_id
WHERE so.staff_id IS NOT NULL;

UPDATE `benefit-claim`.project p
    INNER JOIN `benefit-claim`.a_temp_staff_org_info so
    ON p.project_leader_id = so.staff_id
        AND p.project_leader_belong_department_id = so.old_org_id
SET p.project_leader_belong_department_id = so.org_id,
    p.project_leader_belong_department = so.org_name
WHERE so.staff_id IS NOT NULL;

UPDATE `benefit-claim`.salary_service_commissioner ssc
    INNER JOIN `benefit-claim`.a_temp_staff_org_info so
    ON ssc.service_commissioner_id = so.staff_id
        AND ssc.service_commissioner_belong_department_id = so.old_org_id
SET ssc.service_commissioner_belong_department_id = so.org_id,
    ssc.service_commissioner_belong_department = so.org_name
WHERE so.staff_id IS NOT NULL;