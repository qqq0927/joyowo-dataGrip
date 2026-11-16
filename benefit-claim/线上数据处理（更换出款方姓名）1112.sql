SELECT * from expense_form where form_no = 'ZLSQ20261111000001';
select * from expense_form_detail where form_id = 1570072545905106963;
select * from expense_form_detail_wf where form_detail_id = 1570073295997657128;


update `jy-project-expense`.expense_form_detail
set name = '南京式力建设工程有限公司'
where id = 1570073295997657128;

update `jy-project-expense`.expense_form_detail_wf
set name = '南京式力建设工程有限公司'
where form_detail_id = 1570073295997657128;


SELECT * from expense_form where form_no = 'ZLSQ20261111000001';
select * from expense_form_detail where form_id = 1570072545905106963;

SELECT id,form_status from expense_form where id = 1570072545905106963;
select id,provide_status from expense_form_detail where form_id = 1570072545905106963;
select id,provide_status from expense_form_detail_wf where form_detail_id = 1570073295997657128;



update `jy-project-expense`.expense_form
set form_status = 'UNDER_APPROVAL'
where id = 1570072545905106963;

update `jy-project-expense`.expense_form_detail
set provide_status = 'UNDER_APPROVAL'
where id = 1570073295997657128;

