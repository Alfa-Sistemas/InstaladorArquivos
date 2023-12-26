CREATE TABLE IND_MIST_BIODIESEL (
    CODIGO INTEGER,
    COD_PRODUTO VARCHAR(6),
    INDICADOR_IMPORTACAO INTEGER,
    COD_UF_ORIGEM INTEGER,
    PERCENTUAL_ORIGINARIO_UF FLOAT
);

CREATE SEQUENCE GEN_IND_MIST_BIODIESEL_ID;

SET TERM ~;

create trigger ind_mist_biodiesel_bi for ind_mist_biodiesel
active before insert position 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(gen_ind_mist_biodiesel_id,1);
END~

SET TERM ;~

update RDB$FIELDS set
RDB$FIELD_SCALE = -3
where RDB$FIELD_NAME = 'RDB$5809';
