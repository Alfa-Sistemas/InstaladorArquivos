ALTER TABLE C000068I ADD CONSIDERA_TOTAL CHAR(1);
insert into c000030 (cfop,natureza, tipo) values ('5359', 'Prestação de serviço de transporte a contribuinte ou a não contribuinte quando a mercadoria transportada está dispensada de emissão de nota fiscal.', 2);
ALTER TABLE C000004 ADD FCP_GERAR CHAR(1);
UPDATE C000004 SET FCP_GERAR = 'N';
ALTER TABLE C000004 ADD FCP_PERCENTUAL NUMERIC(15,2);
UPDATE C000004 SET FCP_PERCENTUAL = 0;
ALTER TABLE C000004 ADD FCP_TEXTO VARCHAR(80);
