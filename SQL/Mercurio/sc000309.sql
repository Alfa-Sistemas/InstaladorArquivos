CREATE TABLE ARQUIVOS_IMPRESSAO (
    CODIGO INTEGER NOT NULL,
    ARQUIVO BLOB SUB_TYPE 0 SEGMENT SIZE 80 NOT NULL,
    NOME_ARQUIVO VARCHAR(100));

CREATE SEQUENCE GEN_ARQUIVOS_IMPRESSAO_ID;

SET TERM ^ ;

create trigger arquivos_impressao_bi for arquivos_impressao
active before insert position 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_arquivos_impressao_id,1);
end^

SET TERM ; ^

