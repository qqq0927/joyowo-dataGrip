-- 删表

DROP TABLE IF EXISTS `jy-salary`.a_temp_staff_org_info;

DROP TABLE IF EXISTS `jy-project-expense`.a_temp_staff_org_info;

DROP TABLE IF EXISTS `benefit-claim`.a_temp_staff_org_info;

-- auto-generated definition
CREATE TABLE `jy-salary`.a_temp_staff_org_info
(
    id           BIGINT       NOT NULL
        PRIMARY KEY,
    staff_id     BIGINT       NOT NULL COMMENT '员工id',
    name         VARCHAR(30)  NULL COMMENT '姓名',
    staff_code   VARCHAR(20)  NULL COMMENT '员工工号',
    old_org_id   BIGINT       NOT NULL COMMENT '原当前部门ID',
    old_org_name VARCHAR(255) NOT NULL COMMENT '原当前部门名称',
    l1_id        BIGINT       NULL COMMENT '新1级部门id',
    l1_name      VARCHAR(20)  NULL COMMENT '新1级部门名称',
    l2_id        BIGINT       NULL COMMENT '新2级部门id',
    l2_name      VARCHAR(20)  NULL COMMENT '新2级部门名称',
    l3_id        BIGINT       NULL COMMENT '新3级部门id',
    l3_name      VARCHAR(20)  NULL COMMENT '新3级部门名称',
    l4_id        BIGINT       NULL COMMENT '新4级部门id',
    l4_name      VARCHAR(20)  NULL COMMENT '新4级部门名称',
    l5_id        BIGINT       NULL COMMENT '新5级部门id',
    l5_name      VARCHAR(20)  NULL COMMENT '新5级部门名称',
    org_id       BIGINT       NOT NULL COMMENT '新当前部门ID',
    org_name     VARCHAR(255) NOT NULL COMMENT '新当前部门名称'
)
    COMMENT '临时人员机构信息（组织架构调整用）' ROW_FORMAT = COMPACT;

CREATE TABLE `jy-project-expense`.a_temp_staff_org_info
(
    id           BIGINT       NOT NULL
        PRIMARY KEY,
    staff_id     BIGINT       NOT NULL COMMENT '员工id',
    name         VARCHAR(30)  NULL COMMENT '姓名',
    staff_code   VARCHAR(20)  NULL COMMENT '员工工号',
    old_org_id   BIGINT       NOT NULL COMMENT '原当前部门ID',
    old_org_name VARCHAR(255) NOT NULL COMMENT '原当前部门名称',
    l1_id        BIGINT       NULL COMMENT '新1级部门id',
    l1_name      VARCHAR(20)  NULL COMMENT '新1级部门名称',
    l2_id        BIGINT       NULL COMMENT '新2级部门id',
    l2_name      VARCHAR(20)  NULL COMMENT '新2级部门名称',
    l3_id        BIGINT       NULL COMMENT '新3级部门id',
    l3_name      VARCHAR(20)  NULL COMMENT '新3级部门名称',
    l4_id        BIGINT       NULL COMMENT '新4级部门id',
    l4_name      VARCHAR(20)  NULL COMMENT '新4级部门名称',
    l5_id        BIGINT       NULL COMMENT '新5级部门id',
    l5_name      VARCHAR(20)  NULL COMMENT '新5级部门名称',
    org_id       BIGINT       NOT NULL COMMENT '新当前部门ID',
    org_name     VARCHAR(255) NOT NULL COMMENT '新当前部门名称'
)
    COMMENT '临时人员机构信息（组织架构调整用）' ROW_FORMAT = COMPACT;

CREATE TABLE `benefit-claim`.a_temp_staff_org_info
(
    id           BIGINT       NOT NULL
        PRIMARY KEY,
    staff_id     BIGINT       NOT NULL COMMENT '员工id',
    name         VARCHAR(30)  NULL COMMENT '姓名',
    staff_code   VARCHAR(20)  NULL COMMENT '员工工号',
    old_org_id   BIGINT       NOT NULL COMMENT '原当前部门ID',
    old_org_name VARCHAR(255) NOT NULL COMMENT '原当前部门名称',
    l1_id        BIGINT       NULL COMMENT '新1级部门id',
    l1_name      VARCHAR(20)  NULL COMMENT '新1级部门名称',
    l2_id        BIGINT       NULL COMMENT '新2级部门id',
    l2_name      VARCHAR(20)  NULL COMMENT '新2级部门名称',
    l3_id        BIGINT       NULL COMMENT '新3级部门id',
    l3_name      VARCHAR(20)  NULL COMMENT '新3级部门名称',
    l4_id        BIGINT       NULL COMMENT '新4级部门id',
    l4_name      VARCHAR(20)  NULL COMMENT '新4级部门名称',
    l5_id        BIGINT       NULL COMMENT '新5级部门id',
    l5_name      VARCHAR(20)  NULL COMMENT '新5级部门名称',
    org_id       BIGINT       NOT NULL COMMENT '新当前部门ID',
    org_name     VARCHAR(255) NOT NULL COMMENT '新当前部门名称'
)
    COMMENT '临时人员机构信息（组织架构调整用）' ROW_FORMAT = COMPACT;

-- 删除原始数据
DELETE FROM `jy-salary`.a_temp_staff_org_info;
DELETE FROM `jy-project-expense`.a_temp_staff_org_info;
DELETE FROM `benefit-claim`.a_temp_staff_org_info;


-- 数据sql 函数

=CONCAT("INSERT INTO `jy-salary`.a_temp_staff_org_info (id, staff_id, name, staff_code, old_org_id, old_org_name, l1_id, l1_name, l2_id, l2_name, l3_id, l3_name, l4_id, l4_name, l5_id, l5_name, org_id, org_name) VALUES (",ROW()-1,",",B2,",'",C2,"','",A2,"',",O2,",'",N2,"',",IF(T2="","NULL",T2),",",IF(S2="","NULL",CONCAT("'",S2,"'")),",",IF(V2="","NULL",V2),",",IF(U2="","NULL",CONCAT("'",U2,"'")),",",IF(X2="","NULL",X2),",",IF(W2="","NULL",CONCAT("'",W2,"'")),",",IF(Z2="","NULL",Z2),",",IF(Y2="","NULL",CONCAT("'",Y2,"'")),",",IF(AB2="","NULL",AB2),",",IF(AA2="","NULL",CONCAT("'",AA2,"'")),",",AD2,",'",AC2,"');")
=CONCAT("INSERT INTO `jy-project-expense`.a_temp_staff_org_info (id, staff_id, name, staff_code, old_org_id, old_org_name, l1_id, l1_name, l2_id, l2_name, l3_id, l3_name, l4_id, l4_name, l5_id, l5_name, org_id, org_name) VALUES (",ROW()-1,",",B2,",'",C2,"','",A2,"',",O2,",'",N2,"',",IF(T2="","NULL",T2),",",IF(S2="","NULL",CONCAT("'",S2,"'")),",",IF(V2="","NULL",V2),",",IF(U2="","NULL",CONCAT("'",U2,"'")),",",IF(X2="","NULL",X2),",",IF(W2="","NULL",CONCAT("'",W2,"'")),",",IF(Z2="","NULL",Z2),",",IF(Y2="","NULL",CONCAT("'",Y2,"'")),",",IF(AB2="","NULL",AB2),",",IF(AA2="","NULL",CONCAT("'",AA2,"'")),",",AD2,",'",AC2,"');")
=CONCAT("INSERT INTO `benefit-claim`.a_temp_staff_org_info (id, staff_id, name, staff_code, old_org_id, old_org_name, l1_id, l1_name, l2_id, l2_name, l3_id, l3_name, l4_id, l4_name, l5_id, l5_name, org_id, org_name) VALUES (",ROW()-1,",",B2,",'",C2,"','",A2,"',",O2,",'",N2,"',",IF(T2="","NULL",T2),",",IF(S2="","NULL",CONCAT("'",S2,"'")),",",IF(V2="","NULL",V2),",",IF(U2="","NULL",CONCAT("'",U2,"'")),",",IF(X2="","NULL",X2),",",IF(W2="","NULL",CONCAT("'",W2,"'")),",",IF(Z2="","NULL",Z2),",",IF(Y2="","NULL",CONCAT("'",Y2,"'")),",",IF(AB2="","NULL",AB2),",",IF(AA2="","NULL",CONCAT("'",AA2,"'")),",",AD2,",'",AC2,"');")

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