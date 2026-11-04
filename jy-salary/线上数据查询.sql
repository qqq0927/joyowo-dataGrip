SELECT *
FROM `salary_payroll_detail`
WHERE delete_flag = FALSE
  AND `id` IN (1554450029314232890)
  AND detail_payment_type = 'BANKCARD'
  AND cashier_payment = 3;

SELECT * from salary_payroll where pay_company_id is null and delete_flag = 0;