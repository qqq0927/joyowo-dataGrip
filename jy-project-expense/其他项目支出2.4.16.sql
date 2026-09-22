INSERT INTO fee_type_item (
    id,
    type_id,
    type_name,
    item_name,
    status,
    sort,
    create_time
)
VALUES (
    40,
    4,
    '其他',
    '加班餐费',
    1,
    35,
    NOW()
);


SELECT ef.id                          as formId,
       efd.id                         as id,
       efd.name,
       efd.credentials_type,
       efd.credentials_code,
       efd.fee_type_name,
       efd.fee_item_name,
       ef.pay_date,
       efd.amount,
       efd.ticket_order,
       efd.pay_direction,
       efd.bank_name,
       efd.province,
       efd.city,
       efd.open_bank,
       efd.account,
       efd.remark                     as detailRemark,
       efd.provide_status,
       efd.fail_reason,
       efd.actual_pay_time,
       ef.bill_month,
       ef.pay_company_id,
       ef.pay_company,
       ef.cust_id,
       ef.cust_name,
       ef.project_id,
       ef.project_name,
       ef.project_no,
       ef.sign_subject_id,
       ef.sign_subject,
       ef.combo_id,
       ef.combo_title,
       ef.cont_id,
       ef.cont_code,
       ef.form_no,
       ef.form_name,
       ef.is_dock_bill,
       ef.is_advance,
       ef.is_overt_quota,
       ef.advance_amount,
       ef.payment_received_date,
       ef.payment_received_sn,
       ef.remark,
       efd.payment_voucher_url,
       efd.create_staff_id,
       efd.create_staff_name,
       efd.create_time,
       ef.applicant_staff_id,
       ef.applicant_staff_name,
       ef.applicant_branch_office,
       ef.application_time,
       ef.approval_id,
       ef.approval_code,
       ef.approved_time,
       efd.expect_repay_time,
       efd.actual_pay_staff_id,
       efd.actual_pay_staff_name,
       efd.cancel_time,
       efd.update_time,
       efd.update_staff_name,
       ef.compensate_type,
       ef.case_no,
       efd.cashier_payment,
       efd.detail_no,
       efd.detail_verification_status,
       efd.detail_verification_time,
       efd.have_rental_contract,
       efcsd.approval_code            as contractApprovalCode,
       efcsd.cont_sup_approval_status as contSupApprovalStatus
FROM expense_form_detail as efd
         LEFT JOIN expense_form as ef on efd.form_id = ef.id
         LEFT JOIN project_service_commissioner as psc on ef.project_id = psc.project_id
         left JOIN expense_form_cont_sup_detail efcsd
                   on efd.contract_approval_id = efcsd.approval_id and efd.id = efcsd.detail_id and
                      efcsd.delete_flag = FALSE
WHERE TRUE
  AND efd.delete_flag = FALSE
  AND efd.draft = 0
  AND ef.delete_flag = FALSE
  AND ef.draft = 0
  AND efd.id in (1550566193445380132)
GROUP BY efd.id
ORDER BY efd.id DESC;


INSERT INTO `jy-project-expense`.fee_type_item (
    id,
    type_id,
    type_name,
    item_name,
    status,
    sort,
    create_time
)
VALUES (
           40,
           4,
           '其他',
           '加班餐费',
           1,
           35,
           NOW()
       );