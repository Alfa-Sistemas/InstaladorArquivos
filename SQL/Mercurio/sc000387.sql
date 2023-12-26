SET TERM ^ ;

CREATE trigger variacao_preco_venda_ins for variacao_preco_venda
active after insert position 0
AS
BEGIN
 IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'VARIACAO_PRECO_VENDA' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('VARIACAO_PRECO_VENDA', NEW.CODIGO, 'INSERT', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'INSERT', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'VARIACAO_PRECO_VENDA' AND COD_TABELA = NEW.CODIGO;
END^

SET TERM ; ^

SET TERM ^ ;

CREATE trigger variacao_preco_venda_upd for variacao_preco_venda
active after update position 0
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'VARIACAO_PRECO_VENDA' AND COD_TABELA = NEW.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('VARIACAO_PRECO_VENDA', NEW.CODIGO, 'UPDATE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'UPDATE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'VARIACAO_PRECO_VENDA' AND COD_TABELA = NEW.CODIGO;
END^

SET TERM ; ^

SET TERM ^ ;

CREATE trigger variacao_preco_venda_del for variacao_preco_venda
active before delete position 0
AS
BEGIN
    IF ( (SELECT COUNT(*) FROM PENDENTE WHERE TABELA = 'VARIACAO_PRECO_VENDA' AND COD_TABELA = OLD.CODIGO) = 0 ) THEN
        /*se nao estiver na tabela pendente, cadastra*/
        INSERT INTO PENDENTE(TABELA, COD_TABELA, ACAO, SERVIDORPDV, TRAYAPI)
        VALUES              ('VARIACAO_PRECO_VENDA', OLD.CODIGO, 'DELETE', '', 0);
    ELSE
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'DELETE', ServidorPDV = '', TrayAPI = 0
        WHERE TABELA = 'VARIACAO_PRECO_VENDA' AND COD_TABELA = OLD.CODIGO;
END^

SET TERM ; ^

