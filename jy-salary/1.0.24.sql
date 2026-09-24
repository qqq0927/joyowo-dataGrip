SELECT id,bill_no,bill_name,version,sign_subject,bill_confirm_month from salary_payroll_push_bill_record where sign_subject is null ;

UPDATE `jy-salary`.`salary_payroll_push_bill_record` SET `bill_no` = 'ZD2026080385362', `bill_name` = NULL, `version` = NULL, `sign_subject` = NULL, `bill_confirm_month` = NULL WHERE `id` = 1537766421049823282;
UPDATE `jy-salary`.`salary_payroll_push_bill_record` SET `bill_no` = 'ZD2026080385362', `bill_name` = NULL, `version` = NULL, `sign_subject` = NULL, `bill_confirm_month` = NULL WHERE `id` = 1537768084344098847;
UPDATE `jy-salary`.`salary_payroll_push_bill_record` SET `bill_no` = 'ZD2026081887412', `bill_name` = NULL, `version` = NULL, `sign_subject` = NULL, `bill_confirm_month` = NULL WHERE `id` = 1539230160601268275;
UPDATE `jy-salary`.`salary_payroll_push_bill_record` SET `bill_no` = 'ZD2026080585558', `bill_name` = NULL, `version` = NULL, `sign_subject` = NULL, `bill_confirm_month` = NULL WHERE `id` = 1540416418954395670;
UPDATE `jy-salary`.`salary_payroll_push_bill_record` SET `bill_no` = 'ZD2026082588215', `bill_name` = NULL, `version` = NULL, `sign_subject` = NULL, `bill_confirm_month` = NULL WHERE `id` = 1542226250170679326;
UPDATE `jy-salary`.`salary_payroll_push_bill_record` SET `bill_no` = 'ZD2026090288791', `bill_name` = NULL, `version` = NULL, `sign_subject` = NULL, `bill_confirm_month` = NULL WHERE `id` = 1549377526967173147;


UPDATE `jy-salary`.`salary_payroll_push_bill_record`
SET
    `bill_name` = '广州寿司郎7月费用',
    `version` = 1,
    `sign_subject` = '江西标矩信息科技有限公司',
    `bill_confirm_month` = '2026-08'
WHERE `id` = 1537766421049823282;

UPDATE `jy-salary`.`salary_payroll_push_bill_record`
SET
    `bill_name` = '广州寿司郎7月费用',
    `version` = 1,
    `sign_subject` = '江西标矩信息科技有限公司',
    `bill_confirm_month` = '2026-08'
WHERE `id` = 1537768084344098847;

UPDATE `jy-salary`.`salary_payroll_push_bill_record`
SET
    `bill_name` = NULL,
    `version` = 2,
    `sign_subject` = '四川柚融信息科技有限公司',
    `bill_confirm_month` = '2026-08'
WHERE `id` = 1539230160601268275;

UPDATE `jy-salary`.`salary_payroll_push_bill_record`
SET
    `bill_name` = NULL,
    `version` = 2,
    `sign_subject` = '江西标矩信息科技有限公司',
    `bill_confirm_month` = '2026-08'
WHERE `id` = 1540416418954395670;

UPDATE `jy-salary`.`salary_payroll_push_bill_record`
SET
    `bill_name` = NULL,
    `version` = 2,
    `sign_subject` = '江西标矩信息科技有限公司',
    `bill_confirm_month` = '2026-08'
WHERE `id` = 1542226250170679326;

UPDATE `jy-salary`.`salary_payroll_push_bill_record`
SET
    `bill_name` = '8月份寿司郎费用',
    `version` = 2,
    `sign_subject` = '江西标矩信息科技有限公司',
    `bill_confirm_month` = '2026-09'
WHERE `id` = 1549377526967173147;


SELECT * from salary_payroll_push_bill_record where ID IN(1537766421049823282,
    1537768084344098847,
    1539230160601268275,
    1540416418954395670,
    1542226250170679326,
    1549377526967173147);

SELECT * from salary_payment where approval_id = 1552651957866618909;
SELECT * from salary_payment where payment_no = 1552651957866618909;
select * from salary_payment where expect_pay_date ='2026-09-15' and create_time > '2026-09-24 00:00:00';
