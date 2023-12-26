CREATE TABLE FORMA_PGTO_CLIENTE (
    CODIGO INTEGER NOT NULL,
    COD_CLIENTE VARCHAR(6),
    COD_FORMA_PGTO VARCHAR(6));

ALTER TABLE FORMA_PGTO_CLIENTE
ADD CONSTRAINT PK_FORMA_PGTO_CLIENTE
PRIMARY KEY (CODIGO);

CREATE SEQUENCE GEN_FORMA_PGTO_CLIENTE_ID;

SET TERM ^ ;

create trigger forma_pgto_cliente_bi for forma_pgto_cliente
active before insert position 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_forma_pgto_cliente_id,1);
end^

SET TERM ; ^





CREATE TABLE COND_PGTO_CLIENTE (
    CODIGO INTEGER NOT NULL,
    COD_CLIENTE VARCHAR(6),
    COD_FORMA_PGTO VARCHAR(6),
    COD_COND_PGTO VARCHAR(6));

ALTER TABLE COND_PGTO_CLIENTE
ADD CONSTRAINT PK_COND_PGTO_CLIENTE
PRIMARY KEY (CODIGO);

CREATE SEQUENCE GEN_COND_PGTO_CLIENTE_ID;

SET TERM ^ ;

create trigger cond_pgto_cliente_bi for cond_pgto_cliente
active before insert position 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_cond_pgto_cliente_id,1);
end^

SET TERM ; ^



