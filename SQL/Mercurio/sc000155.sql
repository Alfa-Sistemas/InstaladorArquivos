ALTER TABLE TRAY_INDEX ADD ESTOQUE FLOAT;
ALTER TABLE TRAY_INDEX ADD ATUALIZAR INTEGER;

CREATE OR ALTER trigger c000032_ins for c000032
active after insert position 0
AS
 BEGIN

 UPDATE tray_index SET ATUALIZAR = 1 WHERE CODIGO_INTERNO = NEW.CODPRODUTO
    AND TIPO = 'produto';

 if ((new.SITUACAO IS Null) OR (new.SITUACAO=1))  then
 BEGIN
   if (new.movimento in (1,3,7,8,12,13,16,21)) then
      UPDATE c000100
      SET estoque_atual = estoque_inicial + (entradas + new.movimento_estoque) - saidas,
          entradas = entradas + new.movimento_estoque,
          ultima_entrada = new.data,
          nota_fiscal = new.numeronota
      WHERE codproduto = new.codproduto;
   else
    if (new.movimento in (2,4,5,6,9,11,14,15,17,18,19,20)) then
       UPDATE c000100
       SET estoque_atual = estoque_inicial + entradas - (saidas + (new.movimento_estoque * (-1))),
           saidas = saidas + (new.movimento_estoque * (-1)),
           ultima_saida = new.data
       WHERE codproduto = new.codproduto;
     else
     BEGIN
       if (new.movimento_estoque > 0) then
       BEGIN
          UPDATE c000100
          SET estoque_atual =  estoque_inicial + (entradas + new.movimento_estoque) - saidas,
              entradas = entradas + new.movimento_estoque
        WHERE codproduto = new.codproduto;
       END
       else
       BEGIN
          UPDATE c000100
          SET estoque_atual = estoque_inicial + entradas - (saidas + (new.movimento_estoque * (-1))),
              saidas = saidas + (new.movimento_estoque * (-1))
          WHERE codproduto = new.codproduto;
       END
     END
   END
 END