SELECT spd.id,
       spd.name,
       spd.pay_company,
       spde.actual_salary,
       spd.payment_status
FROM salary_payroll_detail AS spd
         LEFT JOIN salary_payroll_detail_ext AS spde ON spd.id = spde.payroll_detail_id
where spd.name = '王涛'
  and spd.pay_company = '今元数智科技（山东）有限公司'
  and spde.actual_salary = 120.83;

SELECT spd.id,
       spd.name,
       spd.pay_company,
       spde.actual_salary,
       spd.payment_status
FROM salary_payroll_detail AS spd
         LEFT JOIN salary_payroll_detail_ext AS spde ON spd.id = spde.payroll_detail_id
where spd.name = '田亮'
  and spd.pay_company = '今元数智科技（山东）有限公司'
  and spde.actual_salary = 2763.59;

SELECT spd.id,
       spd.name,
       spd.pay_company,
       spde.actual_salary,
       spd.payment_status
FROM salary_payroll_detail AS spd
         LEFT JOIN salary_payroll_detail_ext AS spde ON spd.id = spde.payroll_detail_id
where spd.name = '张江军'
  and spd.pay_company = '今元数智科技（山东）有限公司'
  and spde.actual_salary = 835.23;


UPDATE `jy-salary`.salary_payroll_detail
SET payment_status = 'SUCCESS'
WHERE id IN (
             1560249181211164723,
             1560667821453529114,
             1560277372843819027
    );

SELECT spd.id,
       spd.name,
       spd.pay_company,
       spde.actual_salary,
       spd.payment_status,
       spd.actual_pay_time

FROM salary_payroll_detail AS spd
         LEFT JOIN salary_payroll_detail_ext AS spde ON spd.id = spde.payroll_detail_id
where spd.id in(1560249181211164723,1560667821453529114,1560277372843819027);
select actual_pay_time from salary_payroll_detail where salary_payroll_detail.actual_pay_time is not null order by id desc limit 100

UPDATE `jy-salary`.salary_payroll_detail
SET actual_pay_time = '2026-10-19 00:00:00'
WHERE id IN (
             1560249181211164723,
             1560667821453529114,
             1560277372843819027
    );



