SET TERM ^;

create or alter trigger IBPT_INS AFTER INSERT ON ibpt AS
BEGIN
 IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'IBPT' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('IBPT', NEW.CODIGO, 'INSERT', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'INSERT', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'IBPT' AND COD_TABELA = NEW.CODIGO;
END^

create or alter trigger IBPT_UPD AFTER UPDATE ON ibpt AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'IBPT' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('IBPT', NEW.CODIGO, 'UPDATE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'UPDATE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'IBPT' AND COD_TABELA = NEW.CODIGO;
END^

create or alter trigger IBPT_DEL BEFORE DELETE ON ibpt AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'IBPT' AND COD_TABELA = OLD.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('IBPT', OLD.CODIGO, 'DELETE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'DELETE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'IBPT' AND COD_TABELA = OLD.CODIGO;
END^

SET TERM ;^

UPDATE IBPT SET EX = 0;