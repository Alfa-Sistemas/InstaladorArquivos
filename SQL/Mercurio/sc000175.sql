alter table C000048 alter column NUMERO_CUPOM_FISCAL type varchar(15);
alter table C000048 alter column CODIGO type varchar(15);
alter table C000049 alter column CODIGO type varchar(15);
alter table C000049 alter column CODVENDA type varchar(15);
ALTER TABLE C000025 ADD PRECO_SAZONAL CHAR(1) DEFAULT 'N';
update c000025 set preco_sazonal = 'N';
ALTER TABLE PRODUTO_TABELA ADD DATA_DE DATE;
ALTER TABLE PRODUTO_TABELA ADD DATA_ATE DATE; 