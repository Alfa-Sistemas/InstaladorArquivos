SET TERM ~;

CREATE OR ALTER TRIGGER ATUALIZAR_CABECALHO_NFE FOR C000062 AFTER INSERT OR UPDATE OR DELETE
AS
    DECLARE VARIABLE nfQtdeItens Integer;
    DECLARE VARIABLE nfTotalItens numeric(13, 5);
    DECLARE VARIABLE nfTotalDesconto numeric(13, 5);
    DECLARE VARIABLE nfTotalIPI numeric(13, 5);
    DECLARE VARIABLE nfTotalIcms_Sub numeric(13, 5);
    DECLARE VARIABLE nfTotalBase_Sub numeric(13, 5);
    DECLARE VARIABLE nfBase_Calculo numeric(13, 5);
    DECLARE VARIABLE nfPis numeric(13, 5);
    DECLARE VARIABLE nfCofins numeric(13, 5);
    DECLARE VARIABLE nfValorICMS numeric(13, 5);
    DECLARE VARIABLE nfVol_Qtde numeric(13, 5);
    DECLARE VARIABLE nfPeso_Bruto numeric(13, 3);
    DECLARE VARIABLE nfPeso_liquido numeric(13, 3);
    DECLARE VARIABLE nfeOutrasDespesas numeric(13, 5);
    DECLARE VARIABLE nfeSeguro numeric(13, 5);
    DECLARE VARIABLE nfeFrete numeric(13, 5);
    DECLARE VARIABLE nfeOsTotalGeral numeric(13, 5);
    DECLARE VARIABLE codNota varchar(6);
begin
	codNota = new.codnota;
 
	if ((codNota is null) OR (codNota = ''))  then
    	codNota = old.codnota;
   
	SELECT 
		COALESCE( COUNT(*), 0) ,
		COALESCE( SUM(QTDE * PESO_BRUTO), 0) ,
    COALESCE( SUM(QTDE * PESO_LIQUIDO), 0) ,
    COALESCE( SUM(QTDE), 0) ,
    COALESCE( SUM(VALOR_ICMS), 0) ,
    COALESCE( SUM(COFINS_VALOR), 0) ,
    COALESCE( SUM(PIS_VALOR), 0) ,
    COALESCE( SUM(ROUND(QTDE * UNITARIO, 2)), 0) ,
    COALESCE( SUM(DESCONTO), 0) ,
    COALESCE( SUM(VALOR_IPI), 0) ,
    COALESCE( SUM(ICMS_SUB), 0) ,
    COALESCE( SUM(BASE_SUB), 0) ,
    COALESCE( SUM(BASE_CALCULO), 0)
  FROM C000062
  WHERE CODNOTA = :codNota
  INTO
	  nfQtdeItens,
    nfPeso_Bruto,
    nfPeso_liquido,
    nfVol_Qtde,
    nfValorICMS,
    nfCofins,
    nfPis,
    nfTotalItens,
    nfTotalDesconto,
    nfTotalIPI,
    nfTotalIcms_Sub,
    nfTotalBase_Sub,
    nfBase_Calculo
  ;

  SELECT
    COALESCE( OUTRAS_DESPESAS, 0) ,
    COALESCE( SEGURO, 0) ,
    COALESCE( FRETE, 0) ,
    COALESCE( OS_TOTAL_GERAL, 0)
  FROM C000061
  WHERE CODIGO = :codNota
  INTO
    nfeOutrasDespesas,
    nfeSeguro,
    nfeFrete,
    nfeOsTotalGeral
  ;

  if ((nfQtdeItens = 0) OR (nfQtdeItens is null))  then
  begin
     nfQtdeItens     = 0;
     nfPeso_Bruto    = 0;
     nfPeso_liquido  = 0;
     nfVol_Qtde      = 0;
     nfValorICMS     = 0;
     nfCofins        = 0;
     nfPis           = 0;
     nfBase_Calculo  = 0;
     nfTotalBase_Sub = 0;
     nfTotalDesconto = 0;
     nfTotalItens    = 0;
     nfTotalIPI      = 0;
     nftotalicms_sub = 0;
     nfeOsTotalGeral = 0;
  end

  UPDATE C000061 SET
        ITENS           = :nfQtdeItens,
        PESO_BRUTO      = :nfPeso_Bruto,
        PESO_LIQUIDO    = :nfPeso_liquido,
        VOL_QTDE        = :nfVol_Qtde,
        VALOR_ICMS      = :nfValorICMS,
        COFINS          = :nfCofins,
        PIS             = :nfPis,
        BASE_CALCULO    = :nfBase_Calculo,
        BASE_SUB        = :nfTotalBase_Sub,
        DESCONTO        = :nfTotalDesconto,
        VALOR_PRODUTOS  = :nfTotalItens,
        VALOR_TOTAL_IPI = :nfTotalIPI,
        ICMS_SUB        = :nftotalicms_sub,
        OUTRAS_DESPESAS = :nfeOutrasDespesas,
        SEGURO          = :nfeSeguro,
        FRETE           = :nfeFrete,
        OS_TOTAL_GERAL  = :nfeOsTotalGeral,
        TOTAL_NOTA = (:nfeOsTotalGeral + :nfeFrete + :nfeSeguro + :nfeOutrasDespesas + :nfTotalItens + :nfTotalIPI + :nftotalicms_sub) - :nfTotalDesconto
  WHERE (CODIGO = :codNota);
END~

SET TERM ;~