SET TERM ^ ;

create or alter procedure ST_CUPOM_TEMP_INSERT (
    NUMERO varchar(12),
    ECF varchar(30),
    DATA date,
    HORA time)
as
begin
  insert into cupom_temp
  (numero, ecf, data, hora, totalizado,
  pago1, pago2, pago3, finalizado )
  values
  (:numero, :ecf, :data, :hora,0,0,0,0,0) ;
  suspend;
end^

create or alter procedure ST_CUPOM_INSERT (
    CODIGO varchar(50),
    NUMERO varchar(12),
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
    (codigo, numero, ecf, data, hora, qtde_item, valor_produto,
     valor_desconto, valor_acrescimo, valor_total, valor_pago,
     valor_troco, cod_cliente, cancelado, cpf_consumidor, NOME_CONSUMIDOR,
     cod_vendedor, cod_caixa, ecf_caixa, SERIE_CUPOM, fiscal, numero_fiscal)
  values
    (:codigo, :numero, :ecf, :data, :hora, :qtde_item, :valor_produto,
     :valor_desconto, :valor_acrescimo, :valor_total, :valor_pago,
     :valor_troco, :cod_cliente, :cancelado, :cpf_consumidor, :nome_consumidor,
     :cod_vendedor, :cod_caixa, :ecf_caixa, :SERIE_CUPOM, :fiscal, :numero_fiscal);
  suspend;
end^

SET TERM ; ^

ALTER TABLE CUPOM_TEMP DROP CCF;
ALTER TABLE CUPOM DROP CCF;

