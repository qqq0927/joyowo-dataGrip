select  * from `jy-salary`.salary_city_flat_base where years = 2025 and delete_flag = 0;

SELECT *
FROM `jy-salary`.`salary_city_flat_base`
WHERE `years` = 2025
  AND `delete_flag` = 0;

UPDATE `jy-salary`.`salary_city_flat_base`
SET `delete_flag` = 1
WHERE `years` = 2025
  AND `delete_flag` = 0;