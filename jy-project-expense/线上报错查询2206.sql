SELECT id, case_no from expense_form where ID = 1568286108370620436;

SELECT
    IFNULL(SUM(IF(efd.provide_status = 'SUCCESS', efd.amount, 0)), 0) AS actualCompensationAmount,
    IFNULL(SUM(IF(ef.id != 1568286108370620436
                      AND efd.provide_status NOT IN ('SUCCESS', 'CANCEL'), efd.amount, 0)), 0)
                                                                      AS inTransitCompensationAmount
FROM expense_form ef
         INNER JOIN expense_form_detail efd ON efd.form_id = ef.id AND efd.delete_flag = FALSE
WHERE ef.delete_flag = FALSE
  AND ef.type = 1
  AND ef.case_no = '（2026）嘉南长人调字第63号';


SELECT
    ef.id AS expenseFormId,
    ef.form_name as expenseFormName,
    ef.form_no as expenseFormNo,
    ef.case_no AS caseNo,
    ef.draft as draft,
    efd.id AS detailId,
    efd.provide_status AS provideStatus,
    efd.amount AS amount,
    CASE
        WHEN ef.id = 1568286108370620436 THEN '当前费用单'
        ELSE '其他费用单'
        END AS formType,
    ef.create_time,
    ef.update_time
FROM expense_form ef
         INNER JOIN expense_form_detail efd
                    ON efd.form_id = ef.id
                        AND efd.delete_flag = FALSE
WHERE ef.delete_flag = FALSE
  AND ef.type = 1
  AND ef.case_no = '（2026）嘉南长人调字第63号'
ORDER BY ef.id, efd.id;

SELECT * from expense_form_detail where form_id = 1568277257508376637;

select  * from expense_form where id in (1568277257508376637,
1568286108370620436,
1568301914138501169);

SELECT * from expense_form_detail where form_id in (
                                                    1568277257508376637,
                                                    1568286108370620436,
                                                    1568301914138501169
    );


SELECT
    ef.id AS expenseFormId,
    ef.form_name as expenseFormName,
    ef.form_no as expenseFormNo,
    ef.case_no AS caseNo,
    ef.draft as draft,
    ef.create_time,
    ef.update_time
FROM expense_form ef
WHERE ef.case_no = '（2026）嘉南长人调字第63号';