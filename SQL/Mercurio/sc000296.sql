SET TERM ~;

CREATE OR ALTER trigger c000007_del for c000007
active after delete position 0
AS
BEGIN
    INSERT INTO EXCLUSOES(TABELA, CODIGO, DATA_HORA) VALUES('C000007', old.codigo, current_TIMESTAMP);

    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'C000007' AND COD_TABELA = OLD.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('C000007', OLD.CODIGO, 'DELETE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'DELETE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'C000007' AND COD_TABELA = OLD.CODIGO;
END~

SET TERM ;~