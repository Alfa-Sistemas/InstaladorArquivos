ALTER TABLE REMESSA_NFE_ITEM ADD QTDE_CONSIGNACAO NUMERIC(15,3);
UPDATE REMESSA_NFE_ITEM SET QTDE_CONSIGNACAO = '0';
CREATE trigger trocvendedor_c000007 for c000007 active before update position 0 AS begin if (new.codvendedor <> old.codvendedor) then begin insert into EXCLUSOES(TABELA, CODIGO, DATA_HORA) Values('C000007', NEW.codigo, (select current_timestamp from rdb$database)); end end;