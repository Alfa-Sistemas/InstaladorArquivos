set term ~;

CREATE OR ALTER trigger c000025_del for c000025
active after delete position 0
AS
BEGIN
    INSERT INTO EXCLUSOES(TABELA, CODIGO, DATA_HORA) VALUES('C000025', old.codigo, current_TIMESTAMP);

    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'C000025' AND COD_TABELA = OLD.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('C000025', OLD.CODIGO, 'DELETE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'DELETE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'C000025' AND COD_TABELA = OLD.CODIGO;
END~
set term ;~