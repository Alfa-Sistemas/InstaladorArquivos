set term ~;

CREATE OR ALTER trigger c000014_ultimaalteracao for c000014
active after insert or update or delete position 0
AS
begin
    UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000014';
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('C000014', OLD.codigo, current_TIMESTAMP);
end~
set term ;~
