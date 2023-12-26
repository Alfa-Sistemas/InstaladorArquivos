ALTER TABLE FORMA_PGTO_CLIENTE
ADD ULTIMA_ALTERACAO TIMESTAMP;

ALTER TABLE COND_PGTO_CLIENTE
ADD ULTIMA_ALTERACAO TIMESTAMP;

SET TERM ^ ;

CREATE trigger c000014_ultimaalteracao_ins_upd for c000014
active after insert or update position 0
AS
begin
  UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000014';
end^

SET TERM ; ^

DROP TRIGGER C000014_ULTIMAALTERACAO;

SET TERM ^ ;

CREATE OR ALTER trigger c000014_ultimaalteracao_del for c000014
active after delete position 0
AS
begin
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('C000014', OLD.codigo, current_TIMESTAMP);
end^

SET TERM ; ^


SET TERM ^ ;

CREATE trigger c000015_ultimaalteracao_ins_upd for c000015
active after insert or update position 0
AS
begin
  UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000015';
end^

SET TERM ; ^

DROP TRIGGER C000015_ULTIMAALTERACAO;

SET TERM ^ ;

CREATE OR ALTER trigger c000015_ultimaalteracao_del for c000015
active after delete position 0
AS
begin
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('C000015', OLD.codigo, current_TIMESTAMP);
end^

SET TERM ; ^

SET TERM ^ ;

CREATE trigger forma_clienteultimalalt_ins_upd for forma_pgto_cliente
active after insert or update position 0
AS
begin
    UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000014';
end^

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger forma_clienteultimaalt_del for forma_pgto_cliente
active after delete position 0
AS
begin
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('FORMA_PGTO_CLIENTE', OLD.codigo, current_TIMESTAMP);
end^

SET TERM ; ^

SET TERM ^ ;

CREATE trigger cond_clienteultimaalt_ins_upd for cond_pgto_cliente
active after insert or update position 0
AS
begin
    UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000015';
end^

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger cond_clienteultimaalt_del for cond_pgto_cliente
active after delete position 0
AS
begin
    INSERT INTO EXCLUSOES (TABELA, CODIGO, DATA_HORA) VALUES('COND_PGTO_CLIENTE', OLD.codigo, current_TIMESTAMP);
end^

SET TERM ; ^
















