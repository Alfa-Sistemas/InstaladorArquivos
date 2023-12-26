INSERT INTO C000023 (CODIGO, TRIBUTADO, AC, AL, AM, AP, BA, CE, DF, ES, GO, MA, MG, MS, MT, PA, PB, PE, PI, PR, RJ, RN, RO, RR, RS, SC, SE, SP, TOC, EX) VALUES ('1', 'S', 17, 18, 18, 18, 18, 18, 18, 17, 17, 18, 18, 17, 17, 17, 18, 17, 17, 18, 20, 17, 17.5, 17, 18, 17, 18, 18, 18, 0);
ALTER TABLE C000001 ADD NF_CALCULARCFOPITENS INTEGER;
UPDATE C000001 SET NF_CALCULARCFOPITENS = 0;
insert into c000082 (codigo, modelo, sigla, sintegra) values (36,'Conhecimento de Transporte Eletrônico (Outros Serviços) - CT-e OS', 'CTEOS', '67');