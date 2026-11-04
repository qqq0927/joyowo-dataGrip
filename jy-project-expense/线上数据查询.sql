SELECT id, expense_form.form_no, form_name,combo_id,combo_title,delete_flag
from expense_form
where combo_title = '今元业务包' and cont_code='GB-2607220004 ';

SELECT * from sync_bill_record where amount = '1120192.80';
SELECT * from expense_form_detail where biz_no = '1554865769604517896';
SELECT * from expense_form where id = 1554865045457932289;

SELECT * from expense_form_detail where form_id = 1554865045457932289;