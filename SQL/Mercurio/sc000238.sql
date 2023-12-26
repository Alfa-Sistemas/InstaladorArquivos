DROP TRIGGER CHECK_1;

SET TERM ~;

CREATE OR ALTER TRIGGER C000025_INS FOR C000025 AFTER INSERT
AS
BEGIN
    EXECUTE PROCEDURE c000100_insert(new.codigo, '000001',new.estoque,0,0,new.estoque, new.data_cadastro,null,'000000');

    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'C000025' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('C000025', NEW.CODIGO, 'INSERT', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'INSERT', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'C000025' AND COD_TABELA = NEW.CODIGO;
END~

CREATE OR ALTER TRIGGER C000025_UPD FOR C000025 AFTER UPDATE
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'C000025' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('C000025', NEW.CODIGO, 'UPDATE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'UPDATE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'C000025' AND COD_TABELA = NEW.CODIGO;
END~

CREATE OR ALTER TRIGGER C000025_DEL FOR C000025 AFTER DELETE
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'C000025' AND COD_TABELA = OLD.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('C000025', OLD.CODIGO, 'DELETE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'DELETE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'C000025' AND COD_TABELA = OLD.CODIGO;
END~

SET TERM ;~