ALTER TABLE NAO_FISCAL ALTER COO TYPE VARCHAR(20);

CREATE OR ALTER PROCEDURE ST_NAO_FISCAL (CODIGO VARCHAR(50), ECF VARCHAR(30), "DATA" DATE, INDICE VARCHAR(2), DESCRICAO VARCHAR(30), VALOR NUMERIC(15,2), COO VARCHAR(20), GNF VARCHAR(6), GRG VARCHAR(6), CDC VARCHAR(6), DENOMINACAO VARCHAR(2), "HORA" TIME)
AS
begin
  insert into NAO_FISCAL
  (codigo,ecf,data,indice,descricao,valor, coo, gnf, grg, cdc, denominacao, hora)
  values
  (:codigo,:ecf,:data,:indice,:descricao,:valor,:coo,:gnf,:grg,:cdc,:denominacao,:hora);
  suspend;
end;
