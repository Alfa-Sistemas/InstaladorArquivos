SET TERM #;
EXECUTE block as
BEGIN
 	if (exists(select 0 from rdb$relation_constraints
        	   where rdb$constraint_name = 'PK_C000049')) then
        execute statement 'ALTER TABLE C000049 DROP CONSTRAINT PK_C000049';
END#
SET TERM ;#
ALTER TABLE C000049 ALTER CODIGO TYPE VARCHAR(15);
ALTER TABLE C000049 ADD CONSTRAINT PK_C000049 PRIMARY KEY (CODIGO);