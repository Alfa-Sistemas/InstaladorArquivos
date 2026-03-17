DROP TRIGGER ATUALIZAR_CABECALHO_NFE;

CREATE TRIGGER ATUALIZAR_CABECALHO_NFE FOR C000062 AFTER INSERT OR UPDATE OR DELETE
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
    DECLARE VARIABLE nfIbsCbsBaseCalculo numeric(13, 5);
    DECLARE VARIABLE nfIbsUfDiferenca numeric(13, 5);
    DECLARE VARIABLE nfIbsUfDevTrib numeric(13, 5);
    DECLARE VARIABLE nfIbsUfValor numeric(13, 5);
    DECLARE VARIABLE nfIbsMunDiferenca numeric(13, 5);
    DECLARE VARIABLE nfIbsMunDevTrib numeric(13, 5);
    DECLARE VARIABLE nfIbsMunValor numeric(13, 5);
    DECLARE VARIABLE nfIbsValor numeric(13, 5);
    DECLARE VARIABLE nfCbsDiferenca numeric(13, 5);
    DECLARE VARIABLE nfCbsDevTrib numeric(13, 5);
    DECLARE VARIABLE nfCbsValor numeric(13, 5);
    DECLARE VARIABLE nfTotalIbsCbs numeric(13, 5);
    DECLARE VARIABLE nfVol_Qtde numeric(13, 5);
    DECLARE VARIABLE nfPeso_Bruto numeric(13, 3);
    DECLARE VARIABLE nfPeso_liquido numeric(13, 3);
    DECLARE VARIABLE nfeOutrasDespesas numeric(13, 5);
    DECLARE VARIABLE nfeSeguro numeric(13, 5);
    DECLARE VARIABLE nfeFrete numeric(13, 5);
    DECLARE VARIABLE nfeOsTotalGeral numeric(13, 5);
    DECLARE VARIABLE codNota varchar(6);
    DECLARE VARIABLE nfeDestino varchar(16);
begin
    codNota = new.codnota;
 
    if ((codNota is null) OR (codNota = ''))  then
        codNota = old.codnota;
   
    SELECT 
        COALESCE( COUNT(*), 0),
        COALESCE( SUM(QTDE * PESO_BRUTO), 0),
        COALESCE( SUM(QTDE * PESO_LIQUIDO), 0),
        COALESCE( SUM(QTDE), 0),
        COALESCE( SUM(VALOR_ICMS), 0),
        COALESCE( SUM(COFINS_VALOR), 0),
        COALESCE( SUM(PIS_VALOR), 0),
        COALESCE( SUM(ROUND(TOTAL + DESCONTO, 2)), 0),
        COALESCE( SUM(DESCONTO), 0),
        COALESCE( SUM(VALOR_IPI), 0),
        COALESCE( SUM(ICMS_SUB), 0),
        COALESCE( SUM(BASE_SUB), 0),
        COALESCE( SUM(BASE_CALCULO), 0),
        COALESCE( SUM(IBSCBS_VBC), 0),
        COALESCE( SUM(IBS_V), 0),
        COALESCE( SUM(IBS_UF_VDIF), 0),
        COALESCE( SUM(IBS_UF_VDEVTRIB), 0),
        COALESCE( SUM(IBS_UF_V), 0),
        COALESCE( SUM(IBS_MUN_VDIF), 0),
        COALESCE( SUM(IBS_MUN_VDEVTRIB), 0),
        COALESCE( SUM(IBS_MUN_V), 0),
        COALESCE( SUM(CBS_VDIF), 0),
        COALESCE( SUM(CBS_VDEVTRIB), 0),
        COALESCE( SUM(CBS_V), 0)
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
        nfBase_Calculo,
		nfIbsCbsBaseCalculo,
		nfIbsValor,
		nfIbsUfDiferenca,
		nfIbsUfDevTrib,
		nfIbsUfValor,
		nfIbsMunDiferenca,
		nfIbsMunDevTrib,
		nfIbsMunValor,
		nfCbsDiferenca,
		nfCbsDevTrib,
		nfCbsValor;

  SELECT
    COALESCE( OUTRAS_DESPESAS, 0),
    COALESCE( SEGURO, 0),
    COALESCE( FRETE, 0),
    COALESCE( OS_TOTAL_GERAL, 0),
    NFE_DESTINO
  FROM C000061
  WHERE CODIGO = :codNota
  INTO
    nfeOutrasDespesas,
    nfeSeguro,
    nfeFrete,
    nfeOsTotalGeral,
    nfeDestino;

  if ((nfQtdeItens = 0) OR (nfQtdeItens is null))  then
  BEGIN
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
	 nfIbsCbsBaseCalculo = 0;
	 nfIbsValor = 0;
	 nfIbsUfDiferenca = 0;
	 nfIbsUfDevTrib = 0;
	 nfIbsUfValor = 0;
	 nfIbsMunDiferenca = 0;
	 nfIbsMunDevTrib = 0;
	 nfIbsMunValor = 0;
	 nfCbsDiferenca = 0;
	 nfCbsDevTrib = 0;
	 nfCbsValor = 0;
  END

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
        TOTAL_NOTA = (:nfeOsTotalGeral + :nfeFrete + :nfeSeguro + :nfeOutrasDespesas + :nfTotalItens + :nfTotalIPI + :nftotalicms_sub) - :nfTotalDesconto,
        TOTAL_VBCIBSCBS = :nfIbsCbsBaseCalculo,
        TOTAL_IBS_UF_VDIF = :nfIbsUfDiferenca,
        TOTAL_IBS_UF_VDEVTRIB = :nfIbsUfDevTrib,
        TOTAL_IBS_UF_V = :nfIbsUfValor,
        TOTAL_IBS_MUN_VDIF = :nfIbsMunDiferenca,
        TOTAL_IBS_MUN_VDEVTRIB = :nfIbsMunDevTrib,
        TOTAL_IBS_MUN_V = :nfIbsMunValor,
        TOTAL_IBS_V = :nfIbsValor,
        TOTAL_CBS_VDIF = :nfCbsDiferenca,
        TOTAL_CBS_VDEVTRIB = :nfCbsDevTrib,
        TOTAL_CBS_V = :nfCbsValor,
        TOTAL_VNF = (:nfeOsTotalGeral + :nfeFrete + :nfeSeguro + :nfeOutrasDespesas + :nfTotalItens + :nfIbsValor + :nfCbsValor) - :nfTotalDesconto
  WHERE (CODIGO = :codNota);
 
  -- 23/12/2021 - Soppell - Conzatti - Quando for consumidor final devera somar o valor do icms no total da nota --
    if (nfeDestino = 'Consumidor Final') THEN
        if (nfTotalIPI > 0) then
        BEGIN
          UPDATE C000061 SET TOTAL_NOTA = ROUND(TOTAL_NOTA + :nfValorICMS, 2)
          WHERE (CODIGO = :codNota);
        END
END;