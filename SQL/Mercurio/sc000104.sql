CREATE TABLE APP_ULTIMA_ALTERACAO (TABELA VARCHAR(40), ULTIMA_ALTERACAO DATE);


INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000003', '01-SEP-17');
CREATE OR ALTER trigger c000003_ultimaalteracao for c000003 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000003'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000004', '01-SEP-17');
CREATE OR ALTER trigger c000004_ultimaalteracao for c000004 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000004'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000005', '01-SEP-17');
CREATE OR ALTER trigger c000005_ultimaalteracao for c000005 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000005'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000007', '01-SEP-17');
CREATE OR ALTER trigger c000007_ultimaalteracao for c000007 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000007'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000008', '01-SEP-17');
CREATE OR ALTER trigger c000008_ultimaalteracao for c000008 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000008'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000010', '01-SEP-17');
CREATE OR ALTER trigger c000010_ultimaalteracao for c000010 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000010'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000014', '01-SEP-17');
CREATE OR ALTER trigger c000014_ultimaalteracao for c000014 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000014'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000015', '01-SEP-17');
CREATE OR ALTER trigger c000015_ultimaalteracao for c000015 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000015'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000016', '01-SEP-17');
CREATE OR ALTER trigger c000016_ultimaalteracao for c000016 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000016'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000021', '01-SEP-17');
CREATE OR ALTER trigger c000021_ultimaalteracao for c000021 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000021'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000025', '01-SEP-17');
CREATE OR ALTER trigger c000025_ultimaalteracao for c000025 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000025'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000048', '01-SEP-17');
CREATE OR ALTER trigger c000048_ultimaalteracao for c000048 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000048'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C000049', '01-SEP-17');
CREATE OR ALTER trigger c000049_ultimaalteracao for c000049 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000049'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('C999999', '01-SEP-17');
CREATE OR ALTER trigger c999999_ultimaalteracao for c999999 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C999999'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('TABELA_PRECOS', '01-SEP-17');
CREATE OR ALTER trigger TABELA_PRECOS_ultimaalteracao for TABELA_PRECOS active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'TABELA_PRECOS'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('PRODUTO_TABELA', '01-SEP-17');
CREATE OR ALTER trigger PRODUTO_TABELA_ultimaalteracao for PRODUTO_TABELA active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'PRODUTO_TABELA'; end;

INSERT INTO APP_ULTIMA_ALTERACAO VALUES ('NFE_SERIE_VENDEDOR', '01-SEP-17');
CREATE OR ALTER trigger NFE_SERIE_VENDEDOR_ultima for NFE_SERIE_VENDEDOR active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'NFE_SERIE_VENDEDOR'; end;

ALTER TABLE C000010 ADD ULTIMA_ALTERACAO DATE;
ALTER TABLE C000004 ADD ULTIMA_ALTERACAO DATE;
ALTER TABLE C000062 ADD SERIE_CODIGO_APP INTEGER;
ALTER TABLE NFE_SERIE_VENDEDOR ADD FINALIDADE VARCHAR(1);




