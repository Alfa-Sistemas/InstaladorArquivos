ALTER TABLE CUPOM ADD SERIE_CUPOM INTEGER;
CREATE OR ALTER PROCEDURE ST_CUPOM_INSERT (CODIGO VARCHAR(50), NUMERO VARCHAR(12), CCF VARCHAR(12), ECF VARCHAR(30), "DATA" DATE, "HORA" TIME, QTDE_ITEM INTEGER, VALOR_PRODUTO NUMERIC(15,2), VALOR_DESCONTO NUMERIC(15,2), VALOR_ACRESCIMO NUMERIC(15,2), VALOR_TOTAL NUMERIC(15,2), VALOR_PAGO NUMERIC(15,2), VALOR_TROCO NUMERIC(15,2), COD_CLIENTE INTEGER, CANCELADO INTEGER, CPF_CONSUMIDOR VARCHAR(20), NOME_CONSUMIDOR VARCHAR(40), COD_VENDEDOR INTEGER, COD_CAIXA INTEGER, ECF_CAIXA VARCHAR(3), SERIE_CUPOM integer)
AS
begin
  Insert into CUPOM
    (codigo, numero, ccf, ecf, data, hora, qtde_item, valor_produto,
     valor_desconto, valor_acrescimo, valor_total, valor_pago,
     valor_troco, cod_cliente, cancelado, cpf_consumidor, NOME_CONSUMIDOR,
     cod_vendedor, cod_caixa, ecf_caixa, SERIE_CUPOM)
  values
    (:codigo, :numero, :ccf,  :ecf, :data, :hora, :qtde_item, :valor_produto,
     :valor_desconto, :valor_acrescimo, :valor_total, :valor_pago,
     :valor_troco, :cod_cliente, :cancelado, :cpf_consumidor, :nome_consumidor,
     :cod_vendedor, :cod_caixa, :ecf_caixa, :SERIE_CUPOM);
  suspend;
end;