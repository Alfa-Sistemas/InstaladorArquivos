CREATE TABLE MDFE (
    CODIGO                     VARCHAR(6),
    CODFILIAL                  VARCHAR(6),
    NUMERO                     VARCHAR(6),
    DATA                       DATE,
    SITUACAO                   INTEGER,
    SERIE                      VARCHAR(10),
    OBS                        BLOB SUB_TYPE 1 SEGMENT SIZE 80,
    MDFE_SITUACAO              INTEGER,
    MDFE_XML                   VARCHAR(240),
    MDFE_PROTOCOLO             VARCHAR(100),
    MDFE_PROTOCOLO_DATAHORA    VARCHAR(30),
    MDFE_CANC_PROTOCOLO        VARCHAR(30),
    MDFE_CANC_DATAHORA         VARCHAR(30),
    MDFE_CANC_XML              VARCHAR(240),
    MDFE_CANC_CODIGOSTATUS     VARCHAR(10),
    MDFE_MOTIVO_STATUS         VARCHAR(9),
    EMAILENVIADOMDFE           VARCHAR(100),
    UF_INI                     VARCHAR(2),
    UF_FIM                     VARCHAR(2),
    MODELO                     VARCHAR(10),
    MOTIVO                     VARCHAR(50),
    ESPECIE                    VARCHAR(10),
    INF1                       VARCHAR(80),
    INF2                       VARCHAR(80),
    INF3                       VARCHAR(80),
    INF4                       VARCHAR(80),
    INF5                       VARCHAR(80),
    CODVEICULO                 VARCHAR(6),
    CODVEICULO2                VARCHAR(6),
    CODVEICULO3                VARCHAR(6),
    QUANT_CTE                  INTEGER,
    QUANT_NFE                  INTEGER,
    VALOR_TOTAL_MERCADORIA     NUMERIC(15,2),
    UNID_MEDIDA                VARCHAR(3),
    PESO_BRUTO_TOTAL           NUMERIC(15,2),
    MDFE_CANC_MOTIVOSTATUS     VARCHAR(9),
    MDFE_ENCERRA_DATAHORA      VARCHAR(30),
    MDFE_ENCERRA_PROTOCOLO     VARCHAR(30),
    MDFE_ENCERRA_XML           VARCHAR(240),
    MDFE_ENCERRA_CODIGOSTATUS  VARCHAR(10),
    MDFE_ENCERRA_MOTIVOSTATUS  VARCHAR(9)
);

CREATE TABLE MDFE_CONDUTOR (
    CODIGOMDFE        VARCHAR(6),
    CODTRANSPORTADOR  VARCHAR(6)
);



CREATE TABLE MDFE_DOCUMENTOS (
    CODIGOMDFE              VARCHAR(6),
    MUNICIPIODESCARGA       VARCHAR(10),
    MUNICIPIODESCARGA_NOME  VARCHAR(80),
    TIPO_DOC                VARCHAR(4),
    CHAVE_DOC               VARCHAR(100),
    VALOR                   NUMERIC(15,2),
    PESO                    NUMERIC(15,2),
    NOME_CLIENTE            VARCHAR(80),
    NUMERO_DOC              VARCHAR(6)
);



CREATE TABLE MDFE_MUN_CARREGA (
    CODIGOMDFE        VARCHAR(6),
    CODIGO_MUNICIPIO  VARCHAR(10),
    NOME_MUNICIPIO    VARCHAR(80)
);


CREATE TABLE MDFE_UF_PERCURSO (
    CODIGOMDFE  VARCHAR(6),
    UF          VARCHAR(2)
);

