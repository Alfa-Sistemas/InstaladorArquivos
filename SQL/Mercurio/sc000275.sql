SET TERM ~;

CREATE OR ALTER trigger atualizar_cabecalho_nfe for c000062
active after insert or update or delete position 0
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

  nfQtdeItens      = (SELECT COUNT(*) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfQtdeItens is null) then
     nfQtdeItens = 0;

  nfPeso_Bruto     = (SELECT SUM(QTDE * PESO_BRUTO) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfPeso_Bruto is null) then
     nfPeso_Bruto = 0;

  nfPeso_liquido   = (SELECT SUM(QTDE * PESO_LIQUIDO) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfPeso_liquido is null) then
     nfPeso_liquido = 0;

  nfVol_Qtde       = (SELECT SUM(QTDE) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfVol_Qtde is null) then
     nfVol_Qtde = 0;

  nfValorICMS      = (SELECT SUM(VALOR_ICMS) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfValorICMS is null) then
     nfValorICMS = 0;

  nfCofins         = (SELECT SUM(COFINS_VALOR) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfCofins is null) then
     nfCofins = 0;

  nfPis            = (SELECT SUM(PIS_VALOR) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfPis is null) then
     nfPis = 0;

  nfTotalItens     = (SELECT SUM(ROUND(SUBTOTAL, 2)) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfTotalItens is null) then
     nfTotalItens = 0;

  nfTotalDesconto  = (SELECT SUM(DESCONTO) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfTotalDesconto is null) then
     nfTotalDesconto = 0;

  nfTotalIPI       = (SELECT SUM(VALOR_IPI) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfTotalIPI is null) then
     nfTotalIPI = 0;

  nfTotalIcms_Sub  = (SELECT SUM(ICMS_SUB) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfTotalIcms_Sub is null) then
     nfTotalIcms_Sub = 0;

  nfTotalBase_Sub  = (SELECT SUM(BASE_SUB) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfTotalBase_Sub is null) then
     nfTotalBase_Sub = 0;

  nfBase_Calculo   = (SELECT SUM(BASE_CALCULO) FROM C000062 WHERE CODNOTA = :codNota);
  if (nfbase_calculo is null) then
     nfBase_Calculo = 0;

  nfeOutrasDespesas = (SELECT OUTRAS_DESPESAS FROM C000061 WHERE CODIGO = :codNota);
  if (nfeOutrasDespesas is null) then
     nfeOutrasDespesas = 0;
  nfeSeguro = (SELECT SEGURO FROM C000061 WHERE CODIGO = :codNota);
  if (nfeSeguro is null) then
     nfeSeguro = 0;
  nfeFrete = (SELECT FRETE FROM C000061 WHERE CODIGO = :codNota);
  if (nfeFrete is null) then
     nfeFrete = 0;
  nfeOsTotalGeral = (SELECT OS_TOTAL_GERAL FROM C000061 WHERE CODIGO = :codNota);
  if (nfeOsTotalGeral is null) then
     nfeOsTotalGeral = 0;

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
end~

SET TERM ;~