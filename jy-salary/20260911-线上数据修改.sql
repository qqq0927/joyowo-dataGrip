SELECT  * from salary_payroll where payroll_no = 'RJ202608120924580003';
SELECT  id,cont_id,cont_code,sign_subject_id,sign_subject from salary_payroll where payroll_no = 'RJ202608120924580003';
SELECT * from salary_payroll_detail where payroll_id = 1537029116546699313;

UPDATE `jy-salary`.`salary_payroll`
SET `cont_id` = 1470358155777310761,
    `cont_code` = 'GB-20260209000001',
    `sign_subject_id` = 1448011353718300872,
    `sign_subject` = '今元标矩（江西）企业管理有限公司新疆分公司'
WHERE
    `id` = 1537029116546699313;