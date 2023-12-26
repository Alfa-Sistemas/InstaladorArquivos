CREATE OR ALTER trigger c000025_upd for c000025
active after update position 0
AS BEGIN
if ((NEW.TIPO IS NULL) OR (NEW.TIPO<>'')) then
BEGIN
if ((new.precovenda <> old.precovenda) OR
(new.cst <> old.cst) OR
(new.usa_serial <> old.usa_serial) OR
(new.precovenda1 <> old.precovenda1) OR
(new.referencia <> old.referencia) OR
(new.produto <> old.produto) OR
(new.unidade <> old.unidade) OR
(new.aliquota <> old.aliquota) OR
(new.codbarra <> old.codbarra) OR
(new.situacao <> old.situacao) OR
(new.usa_balanca <> old.usa_balanca) OR
(new.preco_promocao <> old.preco_promocao) OR
(new.data_promocao <> old.data_promocao) OR
(new.CLASSIFICACAO_FISCAL <> old.CLASSIFICACAO_FISCAL) OR
(new.localizacao <> old.localizacao) or
(new.PRODUCAO_PROPRIA <> old.PRODUCAO_PROPRIA) or
(new.fim_promocao <> old.fim_promocao) or
(new.IMPOSTOCA_VBCSTRET <> old.IMPOSTOCA_VBCSTRET) or
(new.IMPOSTOCA_VICMSSTRET <> old.IMPOSTOCA_VICMSSTRET) or
(new.IMPOSTOCA_PST <> old.IMPOSTOCA_PST)) then
BEGIN
    INSERT INTO c000058 (tiporegistro,movimento,codregistro,situacao,c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,data,codigo) values (1,2,old.codigo,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,current_timestamp,null);
END
END
END