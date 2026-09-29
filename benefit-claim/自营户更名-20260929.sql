SELECT * from `benefit-claim`.outsourcing_fee_deduction where sign_subject_name ='深圳市起航人力资源服务有限公司';
SELECT * from `benefit-claim`.claim_request where sign_subject ='深圳市起航人力资源服务有限公司';
SELECT count(*) from `benefit-claim`.project where sign_subject ='深圳市起航人力资源服务有限公司';
SELECT * from `benefit-claim`.project where sign_subject ='深圳市起航人力资源服务有限公司';

UPDATE `benefit-claim`.outsourcing_fee_deduction
SET sign_subject_name = '健坤精工科技（广东）有限公司'
WHERE sign_subject_name = '深圳市起航人力资源服务有限公司';

UPDATE `benefit-claim`.claim_request
SET sign_subject = '健坤精工科技（广东）有限公司'
WHERE sign_subject = '深圳市起航人力资源服务有限公司';

UPDATE `benefit-claim`.project
SET sign_subject = '健坤精工科技（广东）有限公司'
WHERE sign_subject = '深圳市起航人力资源服务有限公司';