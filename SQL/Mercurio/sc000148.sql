ALTER TABLE C000008 ADD F_SUPERVISOR INTEGER;
CREATE TABLE SUPERVISOR_FUNCIONARIO(SF_SUPERVISOR VARCHAR(6) NOT NULL, SF_FUNCIONARIO VARCHAR(6) NOT NULL, SF_SUPERVISOR_DE VARCHAR(1) NOT NULL, ULTIMA_ALTERACAO DATE);
ALTER TABLE SUPERVISOR_FUNCIONARIO ADD CONSTRAINT PK_SUPERVISOR_FUNCIONARIO PRIMARY KEY (SF_SUPERVISOR,SF_FUNCIONARIO);
CREATE trigger att_vendedores_supervisores for c000008 active after update position 0 AS begin if (OLD.codigo <> NEW.codigo) then begin update SUPERVISOR_FUNCIONARIO set SF_SUPERVISOR = new.codigo where SF_SUPERVISOR = old.codigo; end end;
CREATE trigger del_vendedores_supervisores for c000008 active before delete position 0 AS begin delete from SUPERVISOR_FUNCIONARIO where SF_SUPERVISOR = OLD.codigo; end;
CREATE trigger ult_alt_supervisor_insert for supervisor_funcionario active after insert position 0 AS begin update SUPERVISOR_FUNCIONARIO set ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) where SF_SUPERVISOR = NEW.sf_supervisor AND SF_FUNCIONARIO = new.sf_funcionario; end;
CREATE trigger ult_alt_supervisor_update for supervisor_funcionario active after update position 0 AS begin if ((new.sf_supervisor <> old.sf_supervisor) or (new.sf_funcionario <> old.sf_funcionario) or (new.sf_supervisor_de <> old.sf_supervisor_de)) then begin update SUPERVISOR_FUNCIONARIO set ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) where SF_SUPERVISOR = NEW.sf_supervisor AND SF_FUNCIONARIO = new.sf_funcionario; end end;
CREATE trigger del_supervisor_funcionario for supervisor_funcionario active before delete position 0 AS begin INSERT INTO EXCLUSOES(TABELA, CODIGO, DATA_HORA, CODIGO_COMPOSTO) VALUES('SUPERVISOR_FUNCIONARIO', OLD.sf_supervisor, (select current_timestamp from rdb$database), OLD.sf_funcionario); end;
CREATE trigger modif_supervisor_funcionario for c000008 active before update position 0 AS begin if (new.f_supervisor <> old.f_supervisor) then begin delete from SUPERVISOR_FUNCIONARIO where ((SF_SUPERVISOR = new.codigo) or (SF_FUNCIONARIO = new.codigo)); end end;
update RDB$RELATION_FIELDS set RDB$NULL_FLAG = 1 where (RDB$FIELD_NAME = 'TABELA') and (RDB$RELATION_NAME = 'APP_ULTIMA_ALTERACAO');
ALTER TABLE APP_ULTIMA_ALTERACAO ADD CONSTRAINT PK_APP_ULTIMA_ALTERACAO PRIMARY KEY (TABELA);

INSERT INTO APP_ULTIMA_ALTERACAO (TABELA, ULTIMA_ALTERACAO) VALUES ('SUPERVISOR_FUNCIONARIO', (select current_timestamp from rdb$database));
INSERT INTO APP_ULTIMA_ALTERACAO (TABELA, ULTIMA_ALTERACAO) VALUES ('C000001', (select current_timestamp from rdb$database));
INSERT INTO APP_ULTIMA_ALTERACAO (TABELA, ULTIMA_ALTERACAO) VALUES ('C000064', (select current_timestamp from rdb$database));
INSERT INTO APP_ULTIMA_ALTERACAO (TABELA, ULTIMA_ALTERACAO) VALUES ('FOTOS_PRODUTO', (select current_timestamp from rdb$database));

CREATE trigger appalt_supervisor_funcionario for supervisor_funcionario active before insert or update position 0 AS Begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'SUPERVISOR_FUNCIONARIO'; end;
CREATE trigger appalt_configuracao_c000001 for c000001 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000001'; end;
CREATE trigger appalt_configuracao_c000064 for c000064 active after insert or update or delete position 0 AS begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'C000064'; end;
CREATE trigger exc_contabancaria_c000064 for c000064 active before delete position 0 AS begin INSERT INTO EXCLUSOES(TABELA, CODIGO, DATA_HORA) VALUES('CONTA_BANCARIA', OLD.codigo, (select current_timestamp from rdb$database)); end;
CREATE trigger exc_FOTOS_PRODUTO for FOTOS_PRODUTO active before delete position 0 AS begin INSERT INTO EXCLUSOES(TABELA, CODIGO, DATA_HORA, CODIGO_COMPOSTO) VALUES('FOTOS_PRODUTO', OLD.COD_PRODUTO, (select current_timestamp from rdb$database), OLD.COD_FOTO); end;
CREATE trigger alt_fotos_produto for fotos_produto active after insert position 0 AS begin update FOTOS_PRODUTO set ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) where (COD_PRODUTO = new.cod_produto) and (COD_FOTO = new.cod_foto); end;
CREATE trigger appalt_fotos_produto for fotos_produto active before insert or update position 0 AS Begin UPDATE APP_ultima_alteracao SET ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) WHERE TABELA = 'FOTOS_PRODUTO'; end;
CREATE trigger altlocal_fotos_produto for fotos_produto active after update position 0 AS begin if ((new.foto <> old.foto) or (new.descricao <> old.descricao)) then begin update FOTOS_PRODUTO set ULTIMA_ALTERACAO = (select current_timestamp from rdb$database) where (COD_PRODUTO = NEW.cod_produto) AND (COD_FOTO = new.cod_foto); end end;

DROP TRIGGER C000003_ULTIMAALTERACAO;
DELETE FROM APP_ULTIMA_ALTERACAO WHERE TABELA = 'C000003';
ALTER TABLE C000008 ADD FOTO_PERFIL BLOB SUB_TYPE 1 SEGMENT SIZE 32000;
ALTER TABLE C000061 ADD CFOP_DESCRICAO VARCHAR(200);
ALTER TABLE C000062 ADD PRODUTO_NOME VARCHAR(300);