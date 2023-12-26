SET TERM ~;

CREATE OR ALTER TRIGGER C000025_INS FOR C000025 AFTER INSERT
AS
BEGIN
    EXECUTE PROCEDURE c000100_insert(new.codigo, '000001',new.estoque,0,0,new.estoque, new.data_cadastro,null,'000000');

    IF ( (SELECT ID FROM PENDENTE WHERE TABELA = 'C000025' AND COD_TABELA = NEW.CODIGO) IS NULL ) THEN
        
        /*se nao estiver na tabela pendente, cadastra*/
        IF ((SELECT COUNT(ID) FROM PENDENTE) = 0) THEN
            INSERT INTO PENDENTE(ID, TABELA, COD_TABELA, ACAO, ServidorPDV, TrayAPI)
            VALUES
            (1, 'C000025', NEW.CODIGO, 'INSERT', '', 0);
        ELSE
            INSERT INTO PENDENTE(ID, TABELA, COD_TABELA, ACAO, ServidorPDV, TrayAPI)
            VALUES
            ((SELECT MAX(ID)+1 FROM PENDENTE), 'C000025', NEW.CODIGO, 'INSERT', '', 0);
    
    ELSE
        
        /*se estiver na tabela pendente, atualiza*/
        UPDATE PENDENTE SET ACAO = 'INSERT', ServidorPDV = '', TrayAPI = 0 WHERE TABELA = 'C000025' AND COD_TABELA = NEW.CODIGO;

END~

SET TERM ;~