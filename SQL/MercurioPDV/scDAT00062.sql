ALTER TABLE CUPOM_CONSUMIDOR
ADD MOTORISTA VARCHAR(80);

SET TERM ^ ;

CREATE OR ALTER procedure ST_CUPOM_CONSUMIDOR_INSERT (
    CODIGO varchar(50),
    COD_CLIENTE integer,
    NOME varchar(80),
    ENDERECO varchar(80),
    BAIRRO varchar(40),
    CIDADE varchar(50),
    UF varchar(2),
    CEP varchar(9),
    CPF varchar(18),
    RG varchar(20),
    PLACA varchar(10),
    KM varchar(10),
    VENDEDOR varchar(50),
    INFO_ADICIONAL1 varchar(50),
    INFO_ADICIONAL2 varchar(50),
    MOTORISTA varchar(80))
as
begin
  Insert into CUPOM_CONSUMIDOR
    (codigo, cod_cliente,  nome, endereco, bairro, cidade, uf, cep,
     cpf, rg, placa, km, vendedor, info_adicional1, info_adicional2, motorista)
  values
    (:codigo,:cod_cliente,:nome,:endereco,:bairro,:cidade,:uf,:cep,
     :cpf,:rg,:placa,:km,:vendedor,:info_adicional1,:info_adicional2, :motorista);
  suspend;

end^

SET TERM ; ^

