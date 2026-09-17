SELECT COUNT(*) FROM `benefit-claim`.`claim_request`
WHERE `create_staff_department_name` LIKE '%杭州今元标矩科技有限公司%';

SELECT COUNT(*) FROM `benefit-claim`.`outsourcing_fee_deduction`
WHERE `create_staff_department_name` LIKE '%杭州今元标矩科技有限公司%';

SELECT COUNT(*) FROM `benefit-claim`.`project`
WHERE `project_leader_belong_department` LIKE '%杭州今元标矩科技有限公司%';

SELECT COUNT(*) FROM `benefit-claim`.`salary_service_commissioner`
WHERE `service_commissioner_belong_department` LIKE '%杭州今元标矩科技有限公司%';


-- 1. claim_request
UPDATE `benefit-claim`.`claim_request`
SET `create_staff_department_name` =
        REPLACE(
                `create_staff_department_name`,
                '杭州今元标矩科技有限公司',
                '江西心同行同企业管理有限公司'
        )
WHERE `create_staff_department_name` LIKE '%杭州今元标矩科技有限公司%';


-- 2. outsourcing_fee_deduction
UPDATE `benefit-claim`.`outsourcing_fee_deduction`
SET `create_staff_department_name` =
        REPLACE(
                `create_staff_department_name`,
                '杭州今元标矩科技有限公司',
                '江西心同行同企业管理有限公司'
        )
WHERE `create_staff_department_name` LIKE '%杭州今元标矩科技有限公司%';


-- 4. project
UPDATE `benefit-claim`.`project`
SET `project_leader_belong_department` =
        REPLACE(
                `project_leader_belong_department`,
                '杭州今元标矩科技有限公司',
                '江西心同行同企业管理有限公司'
        )
WHERE `project_leader_belong_department` LIKE '%杭州今元标矩科技有限公司%';


-- 5. salary_service_commissioner
UPDATE `benefit-claim`.`salary_service_commissioner`
SET `service_commissioner_belong_department` =
        REPLACE(
                `service_commissioner_belong_department`,
                '杭州今元标矩科技有限公司',
                '江西心同行同企业管理有限公司'
        )
WHERE `service_commissioner_belong_department` LIKE '%杭州今元标矩科技有限公司%';