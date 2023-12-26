ALTER TABLE C000061 ADD ANTECIPADO_PEDIDO_AVISTA NUMERIC(9,2);

COMMENT ON COLUMN C000061.ANTECIPADO_PEDIDO_AVISTA IS 'Quando for uma nota importada dos Pedidos aqui vai o valor que o cliente pagou no ato do Pedido';

