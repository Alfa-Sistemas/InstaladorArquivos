ALTER TABLE IND_MIST_BIODIESEL
ADD ULTIMA_ALTERACAO TIMESTAMP;

SET TERM ~;

CREATE trigger ind_mist_biodiesel_ult_alter for ind_mist_biodiesel
active after insert or update or delete position 0
AS begin 
	UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'IND_MIST_BIODIESEL'; 
END~

CREATE trigger ind_mist_biodiesel_ins for ind_mist_biodiesel
active after insert position 0
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'IND_MIST_BIODIESEL' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('IND_MIST_BIODIESEL', NEW.CODIGO, 'INSERT', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'INSERT', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'IND_MIST_BIODIESEL' AND COD_TABELA = NEW.CODIGO;
END~

CREATE trigger ind_mist_biodiesel_upd for ind_mist_biodiesel
active after update position 0
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'IND_MIST_BIODIESEL' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('IND_MIST_BIODIESEL', NEW.CODIGO, 'UPDATE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'UPDATE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'IND_MIST_BIODIESEL' AND COD_TABELA = NEW.CODIGO;
END~

CREATE trigger ind_mist_biodiesel_del for ind_mist_biodiesel
active after delete position 0
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'IND_MIST_BIODIESEL' AND COD_TABELA = OLD.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('IND_MIST_BIODIESEL', OLD.CODIGO, 'DELETE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'DELETE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'IND_MIST_BIODIESEL' AND COD_TABELA = OLD.CODIGO;
END~

SET TERM ;~





