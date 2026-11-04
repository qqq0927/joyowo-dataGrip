DELETE FROM `jy-project-expense`.a_temp_staff_org_info;

INSERT INTO `jy-project-expense`.a_temp_staff_org_info (
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

-- 其他项目支出
UPDATE `jy-project-expense`.expense_form sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.create_staff_id = so.staff_id
        AND sp.create_staff_belong_department_id = so.old_org_id
SET sp.create_staff_belong_department_id = so.org_id
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.project_service_commissioner sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.service_commissioner_id = so.staff_id
        AND sp.service_commissioner_belong_department_id = so.old_org_id
SET sp.service_commissioner_belong_department_id = so.org_id,
    sp.service_commissioner_belong_department = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.advance_payment_form sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.advance_payment_detail sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.advance_payment_detail_wf sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.advance_payment_form sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.advance_payment_form_wf sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.expense_form sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-project-expense`.expense_form_wf sp
    INNER JOIN `jy-project-expense`.a_temp_staff_org_info so ON sp.applicant_staff_id = so.staff_id
        AND sp.applicant_branch_office = so.old_org_name
SET sp.applicant_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;