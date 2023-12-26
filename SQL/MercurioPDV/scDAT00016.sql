ALTER TABLE ESTOQUE ADD POSTO_PRODUTO_ANP VARCHAR(70);

/*douglas - para capturar os dados da gasolina para emitir a nfce com o cfop correto - 5656*/
ALTER TABLE NFCEITENS ADD COD_POSTO_ABASTECIMENTO INTEGER;
ALTER TABLE CUPOM_ITEM ADD COD_POSTO_ABASTECIMENTO INTEGER;
ALTER TABLE CUPOM_ITEM_TEMP ADD COD_POSTO_ABASTECIMENTO INTEGER;

CREATE OR ALTER PROCEDURE ST_CUPOM_ITEM_INSERT (codigo varchar(50), cod_posto_abastecimento integer, cod_cupom varchar(50), item integer, cod_produto integer, unidade varchar(10), qtde numeric(15,4), valor_unitario numeric(15,3), valor_subtotal numeric(15,2), valor_desconto numeric(15,2), valor_acrescimo numeric(15,2), valor_total numeric(15,2), cst varchar(3), aliquota numeric(15,2), cancelado integer, cod_totalizador varchar(7), tamanho char(5), cor char(5))
as
begin
  Insert into CUPOM_ITEM
    (codigo, cod_cupom, item, cod_produto, unidade, qtde, valor_unitario, valor_subtotal, valor_desconto, valor_acrescimo, valor_total, cst, aliquota, cancelado, cod_totalizador, tamanho, cor, COD_POSTO_ABASTECIMENTO)
  values
    (:codigo, :cod_cupom, :item, :cod_produto, :unidade, :qtde, :valor_unitario, :valor_subtotal, :valor_desconto, :valor_acrescimo, :valor_total, :cst, :aliquota, :cancelado, :cod_totalizador, :tamanho, :cor, :cod_posto_abastecimento);
  suspend;
end;

CREATE OR ALTER PROCEDURE ST_CUPOM_ITEM_TEMP_INSERT (cod_posto_abastecimento integer, codigo varchar(50), cod_cupom varchar(50), item integer, cod_produto integer, unidade varchar(10), qtde numeric(15,4), valor_unitario numeric(15,3), valor_subtotal numeric(15,2), valor_desconto numeric(15,2),
    valor_acrescimo numeric(15,2), valor_total numeric(15,2), cst varchar(3), aliquota numeric(15,2), cancelado integer, cod_totalizador varchar(7), tamanho char(5), cor char(5))
as
begin
  Insert into cupom_item_temp
    (codigo, cod_cupom, item, cod_produto, unidade, qtde, valor_unitario, valor_subtotal, valor_desconto, valor_acrescimo, valor_total, cst, aliquota, cancelado, cod_totalizador, tamanho, cor, COD_POSTO_ABASTECIMENTO)
  values
    (:codigo, :cod_cupom, :item, :cod_produto, :unidade, :qtde, :valor_unitario, :valor_subtotal, :valor_desconto, :valor_acrescimo, :valor_total, :cst, :aliquota, :cancelado, :cod_totalizador, :tamanho, :cor, :COD_POSTO_ABASTECIMENTO);
  suspend;
end;

