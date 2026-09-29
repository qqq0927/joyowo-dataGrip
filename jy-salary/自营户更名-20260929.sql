SELECT * from `jy-salary`.salary_service_info where pay_company = '深圳市起航人力资源服务有限公司';
SELECT * from `jy-salary`.salary_tax_accumulate where pay_company = '深圳市起航人力资源服务有限公司';
SELECT * from `jy-salary`.salary_tax_adjustment where  pay_company = '深圳市起航人力资源服务有限公司';
SELECT * from `jy-salary`.salary_cumulative_special_deduction where  pay_company = '深圳市起航人力资源服务有限公司';
SELECT * from `jy-salary`.salary_tax_adjustment_total where  pay_company = '深圳市起航人力资源服务有限公司';




SELECT * FROM `jy-salary`.salary_service_info
WHERE pay_company = '深圳市起航人力资源服务有限公司';

SELECT * FROM `jy-salary`.salary_tax_accumulate
WHERE pay_company = '深圳市起航人力资源服务有限公司';

SELECT * FROM `jy-salary`.salary_tax_adjustment
WHERE pay_company = '深圳市起航人力资源服务有限公司';

UPDATE `jy-salary`.salary_service_info
SET pay_company = '健坤精工科技（广东）有限公司'
WHERE pay_company = '深圳市起航人力资源服务有限公司';

UPDATE `jy-salary`.salary_tax_accumulate
SET pay_company = '健坤精工科技（广东）有限公司'
WHERE pay_company = '深圳市起航人力资源服务有限公司';

UPDATE `jy-salary`.salary_tax_adjustment
SET pay_company = '健坤精工科技（广东）有限公司'
WHERE pay_company = '深圳市起航人力资源服务有限公司';

UPDATE `jy-salary`.salary_cumulative_special_deduction
SET pay_company = '健坤精工科技（广东）有限公司'
WHERE pay_company = '深圳市起航人力资源服务有限公司';

UPDATE `jy-salary`.salary_tax_adjustment_total
SET pay_company = '健坤精工科技（广东）有限公司'
WHERE pay_company = '深圳市起航人力资源服务有限公司';