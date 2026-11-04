SELECT * from salary_payroll where payroll_no = 'RJ202610271731590097';
select * from salary_payroll_detail where payroll_id = 1564693156856823853 and payment_status = 'cancel';
select * from salary_payroll_detail where payroll_id = 1564693156856823853 and payment_status != 'cancel';


UPDATE `jy-salary`.salary_payroll_detail
SET delete_flag = 1
WHERE payroll_id = 1564693156856823853
  AND payment_status = 'cancel'
  AND delete_flag = 0;

UPDATE `jy-salary`.salary_payroll_detail
SET payment_status = 'PEND_APPLY'
WHERE payroll_id = 1564693156856823853
  AND payment_status != 'cancel'
  AND delete_flag = 0;