set term ~;

CREATE OR ALTER trigger c000015_ultimaalteracao for c000015
active after insert or update or delete position 0
AS
begin
    UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000015';
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('C000015', OLD.codigo, current_TIMESTAMP);
end~
set term ;~

set term ~;
CREATE OR ALTER trigger c000016_ultimaalteracao for c000016
active after insert or update or delete position 0
AS
begin
    UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000016';
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('C000016', OLD.codigo, current_TIMESTAMP);
end~
set term ;~
