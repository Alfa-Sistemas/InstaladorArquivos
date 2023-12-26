ALTER TABLE INTERESSADOS ADD IN_EMAIL DM_VARCHAR_DESCRICAO;
ALTER TABLE IMOVEIS ADD IM_EXCLUSAODATA DM_DATE;
ALTER TABLE IMOVEIS ADD IM_EXCLUSAOUSUARIO DM_VARCHAR_MEDIO;
ALTER TABLE IMOVEIS ADD IM_EXCLUSAOMOTIVO DM_VARCHAR_MEDIO;
ALTER DOMAIN DM_CHAR_TELEFONE TYPE CHAR(11) CHARACTER SET WIN1252;
update interessados set IN_CELULAR = lpad(in_celular, 2, '0') || ' ' || cast(substring(in_celular from 3 for 8) as varchar(8));
update clientes set CL_CELULAR = lpad(cl_celular, 2, '0') || ' ' || cast(substring(cl_celular from 3 for 8) as varchar(8));