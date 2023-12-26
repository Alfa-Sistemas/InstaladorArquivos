update c000025 set estoque = (select c000100.estoque_atual from c000100 where c000100.codproduto = c000025.codigo);
CREATE OR ALTER TRIGGER C000100_UPD FOR C000100
ACTIVE AFTER UPDATE POSITION 0
AS
begin
   /* ATUALIZA O CAMPO ESTOQUE DO CADASTRO DE PRODUTOS */
   if (new.estoque_atual <> old.estoque_atual) then
   begin
      update c000025 set estoque = (select sum(new.estoque_atual) from c000100 where c000100.codproduto = old.codproduto) where codigo = old.codproduto;
      update c000025 set ultima_alteracao = current_timestamp where codigo = old.codproduto;
   end
end