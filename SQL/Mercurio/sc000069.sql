ALTER TABLE C000068I ADD CONSIDERA_TOTAL CHAR(1);
insert into c000030 (cfop,natureza, tipo) values ('5359', 'Presta��o de servi�o de transporte a contribuinte ou a n�o contribuinte quando a mercadoria transportada est� dispensada de emiss�o de nota fiscal.', 2);
ALTER TABLE C000004 ADD FCP_GERAR CHAR(1);
UPDATE C000004 SET FCP_GERAR = 'N';
ALTER TABLE C000004 ADD FCP_PERCENTUAL NUMERIC(15,2);
UPDATE C000004 SET FCP_PERCENTUAL = 0;
ALTER TABLE C000004 ADD FCP_TEXTO VARCHAR(80);
