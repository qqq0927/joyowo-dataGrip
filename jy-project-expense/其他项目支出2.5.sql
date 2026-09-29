
ALTER TABLE `jy-project-expense`.expense_form_push_bill_record
    ADD COLUMN subject_name VARCHAR(64) NULL COMMENT '科目名称'
        AFTER bill_confirm_month,
    ADD COLUMN subject_type VARCHAR(32) NULL COMMENT '科目类型 T(com.joyowo.bill.api.enums.SubjectTypeEnum)'
        AFTER subject_name;