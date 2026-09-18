SELECT spl.id                                  AS id,
       spd.name                                AS name,
       spd.credentials_type                    AS credentialsType,
       spd.credentials_code                    AS credentialsCode,
       spl.project_name                        AS projectName,
       spl.project_no                          AS projectNo,
       spl.cust_name                           AS customerName,
       spl.cont_code                           AS contCode,
       spl.sign_subject                        AS signSubject,
       spl.pay_company_name                    AS payCompany,
       sposig.sp_info_name                     AS signedServiceProvider,
       spocig.sp_com_name                      AS serviceProviderSignSubject,
       spt.expect_pay_date                     AS expectPayDate,
       ssi.payment_day                         AS serviceProviderPayTime,
       spt.pay_date                            AS payDate,
       COALESCE(spde.actual_salary, 0)         AS actualSalary,
       COALESCE(spde.cur_payable_tax, 0)       AS curPayableTax,
       COALESCE(spde.tax_adjustment, 0)        AS taxAdjustment,
       COALESCE(spl.sp_service_fee, 0)         AS spServiceFee,
       COALESCE(spl.sp_cur_dis_ins, 0)         AS spCurDisIns,
       COALESCE(spl.sp_bank_service_charge, 0) AS spBankServiceCharge,
       COALESCE(spl.sp_other, 0)               AS spOther,
       (COALESCE(spde.actual_salary, 0) + COALESCE(spde.cur_payable_tax, 0) - COALESCE(spde.tax_adjustment, 0) +
        COALESCE(spl.sp_service_fee, 0) + COALESCE(spl.sp_cur_dis_ins, 0) + COALESCE(spl.sp_bank_service_charge, 0) +
        COALESCE(spl.sp_other, 0))             AS totalAmount,
       spt.sign_subject_system_id              AS signSubjectSystemId,
       spt.sp_com_system_id                    AS serviceProviderSystemId,
       spd.applicant_staff_name                AS applicantStaffName,
       spd.checker                             AS checker
FROM salary_payment_detail spl
         INNER JOIN salary_payment_detail_payroll_detail_ref spdpdr
                    ON spdpdr.payment_detail_id = spl.id AND spdpdr.payment_id = spl.payment_id
         INNER JOIN salary_payroll_detail spd ON spd.id = spdpdr.payroll_detail_id
         INNER JOIN salary_service_info ssi
                    ON ssi.pay_company_id = spl.pay_company_id AND ssi.delete_flag = 0 AND ssi.type = 1
         LEFT JOIN salary_payroll_detail_ext spde ON spde.payroll_detail_id = spd.id
         INNER JOIN salary_payment_order_cust_info_group spocig
                    ON spocig.id = spdpdr.salary_payment_order_cust_info_group_id AND spocig.delete_flag = FALSE
         INNER JOIN salary_payment_order_sp_info_group sposig
                    ON sposig.id = spdpdr.salary_payment_order_sp_info_group_id AND sposig.delete_flag = FALSE
         INNER JOIN salary_payment spt ON spt.id = spl.payment_id AND spt.draft = 1
WHERE TRUE
  AND spl.check_id IN (1548027850613768205)
GROUP BY spl.id
ORDER BY spl.cust_name DESC, spl.project_no DESC, spl.pay_company_id DESC, spl.id DESC
LIMIT 30;



SELECT sp.id                     as paymentId,
       sp.payment_no             as paymentNo,
       sp.pay_date               as payDate,
       sp.expect_pay_date        as expectPayDate,
       sp.request_pay            as requestPay,
       sp.status                 as status,
       sp.remark                 as remark,
       sp.sign_subject_system_id as signSubjectSystemId,
       sp.sp_com_system_id       as serviceProviderSystemId,
       sp.create_staff_name      as applicant,
       sp.update_staff_id        as updateStaffId,
       sp.create_time            as createTime,
       sp.approval_id            as approvalId,
       sp.approval_code          as approvalCode,
       sp.approval_time          as approvalTime,
       sp.draft                  as draft,
       sp.salary_type            as salaryType,
       sp.payment_type           as paymentType
FROM salary_payment sp
         left join salary_payment_detail_payroll_detail_ref spdpdr on sp.id = spdpdr.payment_id
         LEFT JOIN salary_payroll_detail spd on spdpdr.payroll_detail_id = spd.id
where sp.system_version = 1
  AND sp.payment_type = 1
  AND spd.delete_flag = FALSE
  AND spd.data_status = 'FORMAL'
  AND sp.salary_type IN (1)
  AND sp.pay_date >= '2026-09-26 00:00:00'
  AND sp.pay_date <= '2026-09-26 23:59:59'
  AND spd.credentials_code = 440103200006068667
group by sp.id
order by sp.id desc
LIMIT 30;

SELECT * from salary_payment where payment_no = 'FXQK202609171609530016';


SELECT spd.id,
       spd.name                AS staffName,
       spd.pay_date            AS payDate,
       spd.payroll_id          AS payrollId,
       spd.payment_status      AS paymentStatus,
       spd.offline_info_change AS offlineInfoChange,
       spd.detail_payment_type AS detailPaymentType,
       spd.project_staff_id,
       spd.salary_payment_id   AS paymentId,
       spd.pre_review_status,
       spd.original_payment_type,
       sp.is_dock_bill,
       sp.sign_subject_id,
       spd.pay_company_id,
       sp.enterprise_bank_account,
       sp.enterprise_sub_number,
       sp.enterprise_bank_name,
       sp.sign_subject,
       spd.name_code_change,
       spd.corporate_transfer_flag,
       sp2.system_version      AS systemVersion
FROM salary_payroll_detail spd
         LEFT JOIN salary_payroll sp ON sp.id = spd.payroll_id
         LEFT JOIN salary_payment sp2
                   ON sp2.id = spd.salary_payment_id AND spd.payment_status IN ('FAIL', 'REISSUED_REJECTION')
WHERE spd.data_status = 'FORMAL'
  AND spd.delete_flag = 0
  AND spd.id IN (1542576407387009078)