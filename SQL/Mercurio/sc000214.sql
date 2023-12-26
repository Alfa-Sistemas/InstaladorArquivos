CREATE OR ALTER TRIGGER C000025_UPD FOR C000025 AFTER UPDATE
AS
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
		(new.IMPOSTOCA_PST <> old.IMPOSTOCA_PST) OR
		(NEW.estoque <> OLD.estoque)) then
		BEGIN
			INSERT INTO ESTACAO_PENDENTE
			(CODIGO, TABELA, CODIGO_TABELA, ACAO)
			VALUES
			((SELECT IIF(MAX(CAST(CODIGO AS INTEGER)) IS NULL, 1, MAX(CAST(CODIGO AS INTEGER))+1) FROM ESTACAO_PENDENTE), 'C000025', NEW.CODIGO, 'ALTERAR');
		END
END
