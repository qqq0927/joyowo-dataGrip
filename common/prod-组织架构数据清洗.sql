-- 薪税
UPDATE `jy-salary`.salary_payroll sp
    INNER JOIN `jy-salary`.a_temp_staff_org_info so ON sp.create_staff_id = so.staff_id
        AND sp.create_staff_belong_department_id = so.old_org_id
SET sp.create_staff_belong_department_id = so.org_id,
    sp.create_staff_belong_department = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-salary`.salary_payroll sp
    INNER JOIN `jy-salary`.a_temp_staff_org_info so ON sp.sales_man_staff_id = so.staff_id
        AND sp.sales_man_branch_office = so.old_org_name
SET sp.sales_man_branch_office = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-salary`.project_service_commissioner sp
    INNER JOIN `jy-salary`.a_temp_staff_org_info so ON sp.service_commissioner_id = so.staff_id
        AND sp.service_commissioner_belong_department_id = so.old_org_id
SET sp.service_commissioner_belong_department_id = so.org_id,
    sp.service_commissioner_belong_department = so.org_name
WHERE
    so.staff_id IS NOT NULL;

UPDATE `jy-salary`.salary_apply_record sp
    INNER JOIN `jy-salary`.a_temp_staff_org_info so ON sp.create_staff_id = so.staff_id
        AND sp.create_staff_belong_department_id = so.old_org_id
SET sp.create_staff_belong_department_id = so.org_id,
    sp.create_staff_belong_department = so.org_name
WHERE
    so.staff_id IS NOT NULL;

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