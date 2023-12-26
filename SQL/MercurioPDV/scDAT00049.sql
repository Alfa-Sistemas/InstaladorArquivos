ALTER TABLE CUPOM
ADD FISCAL INTEGER;

ALTER TABLE CUPOM
ADD NUMERO_FISCAL VARCHAR(50);

UPDATE CUPOM SET NUMERO_FISCAL = NUMERO;

UPDATE CUPOM SET FISCAL = IIF(POSITION('N' in NUMERO) > 0, 0, 1);

CREATE TABLE IBPT (
    TABELA INTEGER,
    DESCRICAO VARCHAR(100),
    ALIQNAC NUMERIC(15,2),
    ALIQIMP NUMERIC(15,2),
    ALIQESTADUAL NUMERIC(15,2),
    ALIQMUNICIPAL NUMERIC(15,2),
    CODIGO VARCHAR(10));

CREATE TABLE GRADE_PRODUTO (
    CODIGO VARCHAR(6) NOT NULL,
    CODPRODUTO VARCHAR(6),
    NUMERACAO VARCHAR(10),
    CODBARRA VARCHAR(13),
    ESTOQUE NUMERIC(15,2),
    COR VARCHAR(15));

ALTER TABLE GRADE_PRODUTO
ADD CONSTRAINT PK_GRADE_PRODUTO
PRIMARY KEY (CODIGO);

ALTER TABLE ESTOQUE
ADD USA_GRADE INTEGER;

update RDB$FIELDS set
RDB$FIELD_LENGTH = 500,
RDB$CHARACTER_LENGTH = 500
where RDB$FIELD_NAME = 'RDB$1585';

SET TERM ^ ;

CREATE OR ALTER procedure ST_CUPOM_INSERT (
    CODIGO varchar(50),
    NUMERO varchar(12),
    CCF varchar(12),
    ECF varchar(30),
    DATA date,
    HORA time,
    QTDE_ITEM integer,
    VALOR_PRODUTO numeric(15,2),
    VALOR_DESCONTO numeric(15,2),
    VALOR_ACRESCIMO numeric(15,2),
    VALOR_TOTAL numeric(15,2),
    VALOR_PAGO numeric(15,2),
    VALOR_TROCO numeric(15,2),
    COD_CLIENTE integer,
    CANCELADO integer,
    CPF_CONSUMIDOR varchar(20),
    NOME_CONSUMIDOR varchar(40),
    COD_VENDEDOR integer,
    COD_CAIXA integer,
    ECF_CAIXA varchar(3),
    SERIE_CUPOM integer,
    FISCAL integer,
    NUMERO_FISCAL varchar(50))
as
begin
  Insert into CUPOM
    (codigo, numero, ccf, ecf, data, hora, qtde_item, valor_produto,
     valor_desconto, valor_acrescimo, valor_total, valor_pago,
     valor_troco, cod_cliente, cancelado, cpf_consumidor, NOME_CONSUMIDOR,
     cod_vendedor, cod_caixa, ecf_caixa, SERIE_CUPOM, fiscal, numero_fiscal)
  values
    (:codigo, :numero, :ccf,  :ecf, :data, :hora, :qtde_item, :valor_produto,
     :valor_desconto, :valor_acrescimo, :valor_total, :valor_pago,
     :valor_troco, :cod_cliente, :cancelado, :cpf_consumidor, :nome_consumidor,
     :cod_vendedor, :cod_caixa, :ecf_caixa, :SERIE_CUPOM, :fiscal, :numero_fiscal);
  suspend;
end^

SET TERM ; ^







