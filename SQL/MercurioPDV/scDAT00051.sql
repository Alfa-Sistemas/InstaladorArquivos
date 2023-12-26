SET TERM ^ ;

CREATE OR ALTER PROCEDURE ST_CUPOM_ITEM_INSERT (
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
    CODGRADE varchar(10)
)
as
begin 
    INSERT INTO CUPOM_ITEM
    (
        CODIGO, 
        COD_POSTO_ABASTECIMENTO, 
        COD_CUPOM,
        ITEM,
        COD_PRODUTO,
        UNIDADE,
        QTDE,
        VALOR_UNITARIO,
        VALOR_SUBTOTAL,
        VALOR_DESCONTO,
        VALOR_ACRESCIMO,
        VALOR_TOTAL,
        CST,
        ALIQUOTA,
        CANCELADO,
        COD_TOTALIZADOR,
        TAMANHO,
        COR,
        CODGRADE
    ) values (
        :CODIGO, 
        :COD_POSTO_ABASTECIMENTO, 
        :COD_CUPOM,
        :ITEM,
        :COD_PRODUTO,
        :UNIDADE,
        :QTDE,
        :VALOR_UNITARIO,
        :VALOR_SUBTOTAL,
        :VALOR_DESCONTO,
        :VALOR_ACRESCIMO,
        :VALOR_TOTAL,
        :CST,
        :ALIQUOTA,
        :CANCELADO,
        :COD_TOTALIZADOR,
        :TAMANHO,
        :COR,
        :CODGRADE
    );
    
    suspend; 
end^

SET TERM ; ^

/* Following GRANT statements are generated automatically */

GRANT INSERT ON CUPOM_ITEM TO PROCEDURE ST_CUPOM_ITEM_INSERT;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE ST_CUPOM_ITEM_INSERT TO SYSDBA;