ALTER TABLE CUPOM_ITEM ADD CODBARRAS VARCHAR(20);

set term^;

create or alter procedure ST_CUPOM_ITEM_INSERT (
    CODBARRAS varchar(20),
    CODIGO varchar(50),
    COD_POSTO_ABASTECIMENTO integer,
    COD_CUPOM varchar(50),
    ITEM integer,
    COD_PRODUTO integer,
    UNIDADE varchar(10),
    QTDE numeric(15,4),
    VALOR_UNITARIO numeric(15,3),
    VALOR_SUBTOTAL numeric(15,2),
    VALOR_DESCONTO numeric(15,2),
    VALOR_ACRESCIMO numeric(15,2),
    VALOR_TOTAL numeric(15,2),
    CST varchar(3),
    ALIQUOTA numeric(15,2),
    CANCELADO integer,
    COD_TOTALIZADOR varchar(7),
    TAMANHO char(5),
    COR char(5),
    CODGRADE varchar(10))
as
begin
    insert into CUPOM_ITEM(codigo, cod_cupom, item, cod_produto, unidade, qtde, valor_unitario, valor_subtotal, valor_desconto, valor_acrescimo, valor_total, cst, aliquota, cancelado,
    cod_totalizador, tamanho, cor, COD_POSTO_ABASTECIMENTO,CODGRADE, CODBARRAS)
    values
    (:codigo, :cod_cupom, :item, :cod_produto, :unidade, :qtde, :valor_unitario, :valor_subtotal, :valor_desconto, :valor_acrescimo, :valor_total, :cst, :aliquota, :cancelado,
    :cod_totalizador, :tamanho, :cor, :cod_posto_abastecimento, :CODGRADE, :CODBARRAS);

    suspend;
end^

set term ;^