/* this code sets up a dynamic select statement for a set of tables that update in the
format of "clicks_yyyymmdd", with a new table daily. This chunk of code allows a
dynamic query for the current date's table name */

SET @today_var := CONCAT(YEAR(CURRENT_DATE),0,MONTH(CURRENT_DATE),0,DAY(CURRENT_DATE));
SET @table_name := CONCAT(CAST('clicks_' AS CHAR), CAST(@today_var AS SIGNED));
SET @stmt1 :=  SUBSTRING_INDEX(CONCAT('select * from ',@table_name, ' LIMIT 100'),"'",-1);

PREPARE executable_stmt FROM @stmt1;
EXECUTE executable_stmt;
