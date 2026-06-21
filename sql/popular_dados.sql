-- Clientes
INSERT INTO clientes (nome, cidade, estado, segmento, data_cadastro) VALUES
('Ana Silva', 'São Paulo', 'SP', 'Pessoa Física', '2023-01-10'),
('Carlos Mendes', 'Fortaleza', 'CE', 'Pessoa Física', '2023-02-15'),
('Loja Atacado Norte Ltda', 'Fortaleza', 'CE', 'Pessoa Jurídica', '2023-01-20'),
('Fernanda Costa', 'Recife', 'PE', 'Pessoa Física', '2023-03-05'),
('Distribuidora Sul', 'Porto Alegre', 'RS', 'Pessoa Jurídica', '2023-02-28'),
('Marcos Oliveira', 'Belo Horizonte', 'MG', 'Pessoa Física', '2023-04-12'),
('Juliana Rocha', 'Fortaleza', 'CE', 'Pessoa Física', '2023-05-01'),
('Comércio Rápido ME', 'Natal', 'RN', 'Pessoa Jurídica', '2023-03-18');

-- Produtos
INSERT INTO produtos (nome, categoria, custo, preco_venda) VALUES
('Notebook Básico', 'Eletrônicos', 1800.00, 2999.00),
('Mouse Sem Fio', 'Periféricos', 35.00, 89.90),
('Teclado Mecânico', 'Periféricos', 120.00, 259.00),
('Monitor 24"', 'Eletrônicos', 700.00, 1299.00),
('Cadeira Gamer', 'Móveis', 450.00, 899.00),
('Webcam HD', 'Periféricos', 90.00, 199.00),
('HD Externo 1TB', 'Armazenamento', 200.00, 379.00),
('Headset Bluetooth', 'Periféricos', 110.00, 249.00);

-- Vendas (12 meses de histórico)
INSERT INTO vendas (cliente_id, data_venda, valor_total, forma_pagamento, status) VALUES
(1, '2024-01-05', 2999.00, 'Parcelado', 'Paga'),
(2, '2024-01-12', 348.90, 'À Vista', 'Paga'),
(3, '2024-01-18', 7500.00, 'Boleto', 'Paga'),
(4, '2024-02-03', 1299.00, 'Parcelado', 'Paga'),
(5, '2024-02-14', 4500.00, 'Boleto', 'Atrasada'),
(1, '2024-02-20', 899.00, 'À Vista', 'Paga'),
(6, '2024-03-07', 2999.00, 'Parcelado', 'Paga'),
(7, '2024-03-15', 538.00, 'À Vista', 'Paga'),
(2, '2024-03-22', 199.00, 'À Vista', 'Paga'),
(8, '2024-04-02', 3200.00, 'Boleto', 'Atrasada'),
(3, '2024-04-10', 9800.00, 'Boleto', 'Paga'),
(4, '2024-04-25', 249.00, 'À Vista', 'Paga'),
(5, '2024-05-08', 2999.00, 'Parcelado', 'Paga'),
(6, '2024-05-19', 1578.00, 'Parcelado', 'Paga'),
(7, '2024-06-03', 899.00, 'À Vista', 'Paga'),
(1, '2024-06-17', 379.00, 'À Vista', 'Paga'),
(8, '2024-07-01', 5600.00, 'Boleto', 'Pendente'),
(2, '2024-07-14', 259.00, 'À Vista', 'Paga'),
(3, '2024-07-28', 12000.00, 'Boleto', 'Paga'),
(4, '2024-08-05', 2999.00, 'Parcelado', 'Atrasada'),
(5, '2024-08-19', 899.00, 'À Vista', 'Paga'),
(6, '2024-09-02', 1299.00, 'Parcelado', 'Paga'),
(7, '2024-09-16', 538.00, 'À Vista', 'Paga'),
(1, '2024-10-01', 3500.00, 'Parcelado', 'Paga'),
(8, '2024-10-15', 7800.00, 'Boleto', 'Paga'),
(2, '2024-11-03', 249.00, 'À Vista', 'Paga'),
(3, '2024-11-20', 15000.00, 'Boleto', 'Pendente'),
(5, '2024-12-05', 2999.00, 'Parcelado', 'Paga'),
(6, '2024-12-18', 1578.00, 'À Vista', 'Paga'),
(7, '2024-12-28', 899.00, 'À Vista', 'Paga');

-- Despesas mensais
INSERT INTO despesas (data_despesa, categoria, descricao, valor) VALUES
('2024-01-05', 'Salários', 'Folha Janeiro', 8500.00),
('2024-01-10', 'Aluguel', 'Aluguel Janeiro', 3200.00),
('2024-01-15', 'Marketing', 'Anúncios Google Janeiro', 800.00),
('2024-02-05', 'Salários', 'Folha Fevereiro', 8500.00),
('2024-02-10', 'Aluguel', 'Aluguel Fevereiro', 3200.00),
('2024-02-20', 'Utilities', 'Energia e Internet', 450.00),
('2024-03-05', 'Salários', 'Folha Março', 8500.00),
('2024-03-10', 'Aluguel', 'Aluguel Março', 3200.00),
('2024-03-18', 'Marketing', 'Anúncios Google Março', 1200.00),
('2024-04-05', 'Salários', 'Folha Abril', 8500.00),
('2024-04-10', 'Aluguel', 'Aluguel Abril', 3200.00),
('2024-05-05', 'Salários', 'Folha Maio', 8800.00),
('2024-05-10', 'Aluguel', 'Aluguel Maio', 3200.00),
('2024-05-22', 'Marketing', 'Campanha Redes Sociais', 950.00),
('2024-06-05', 'Salários', 'Folha Junho', 8800.00),
('2024-06-10', 'Aluguel', 'Aluguel Junho', 3200.00),
('2024-07-05', 'Salários', 'Folha Julho', 8800.00),
('2024-07-10', 'Aluguel', 'Aluguel Julho', 3200.00),
('2024-08-05', 'Salários', 'Folha Agosto', 8800.00),
('2024-08-10', 'Aluguel', 'Aluguel Agosto', 3200.00),
('2024-08-25', 'Marketing', 'Anúncios Agosto', 1100.00),
('2024-09-05', 'Salários', 'Folha Setembro', 9000.00),
('2024-09-10', 'Aluguel', 'Aluguel Setembro', 3200.00),
('2024-10-05', 'Salários', 'Folha Outubro', 9000.00),
('2024-10-10', 'Aluguel', 'Aluguel Outubro', 3200.00),
('2024-10-20', 'Utilities', 'Energia e Internet', 490.00),
('2024-11-05', 'Salários', 'Folha Novembro', 9000.00),
('2024-11-10', 'Aluguel', 'Aluguel Novembro', 3200.00),
('2024-11-28', 'Marketing', 'Black Friday Ads', 2500.00),
('2024-12-05', 'Salários', '13º + Folha Dezembro', 18000.00),
('2024-12-10', 'Aluguel', 'Aluguel Dezembro', 3200.00),
('2024-12-15', 'Marketing', 'Campanha Natal', 1800.00);

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario) VALUES
-- Venda 1 - Ana Silva (Notebook)
(1, 1, 1, 2999.00),

-- Venda 2 - Carlos Mendes (Mouse + Teclado)
(2, 2, 1, 89.90),
(2, 3, 1, 259.00),

-- Venda 3 - Loja Atacado Norte (Monitor x3 + Notebook x2)
(3, 4, 3, 1299.00),
(3, 1, 2, 2999.00),

-- Venda 4 - Fernanda Costa (Monitor)
(4, 4, 1, 1299.00),

-- Venda 5 - Distribuidora Sul (Cadeira x5)
(5, 5, 5, 899.00),

-- Venda 6 - Ana Silva (Cadeira)
(6, 5, 1, 899.00),

-- Venda 7 - Marcos Oliveira (Notebook)
(7, 1, 1, 2999.00),

-- Venda 8 - Juliana Rocha (Webcam + HD Externo)
(8, 6, 1, 199.00),
(8, 7, 1, 379.00),

-- Venda 9 - Carlos Mendes (Webcam)
(9, 6, 1, 199.00),

-- Venda 10 - Comércio Rápido (Monitor x2 + Cadeira)
(10, 4, 2, 1299.00),
(10, 5, 1, 899.00),

-- Venda 11 - Loja Atacado Norte (Notebook x2 + Monitor x3 + Cadeira x2)
(11, 1, 2, 2999.00),
(11, 4, 3, 1299.00),
(11, 5, 2, 899.00),

-- Venda 12 - Fernanda Costa (Headset)
(12, 8, 1, 249.00),

-- Venda 13 - Distribuidora Sul (Notebook)
(13, 1, 1, 2999.00),

-- Venda 14 - Marcos Oliveira (Monitor + Webcam + HD)
(14, 4, 1, 1299.00),
(14, 6, 1, 199.00),
(14, 7, 1, 379.00),

-- Venda 15 - Juliana Rocha (Cadeira)
(15, 5, 1, 899.00),

-- Venda 16 - Ana Silva (HD Externo)
(16, 7, 1, 379.00),

-- Venda 17 - Comércio Rápido (Notebook + Monitor x2 + Cadeira)
(17, 1, 1, 2999.00),
(17, 4, 2, 1299.00),
(17, 5, 1, 899.00),

-- Venda 18 - Carlos Mendes (Teclado)
(18, 3, 1, 259.00),

-- Venda 19 - Loja Atacado Norte (Notebook x3 + Monitor x2 + Cadeira x2)
(19, 1, 3, 2999.00),
(19, 4, 2, 1299.00),
(19, 5, 2, 899.00),

-- Venda 20 - Fernanda Costa (Notebook)
(20, 1, 1, 2999.00),

-- Venda 21 - Distribuidora Sul (Cadeira)
(21, 5, 1, 899.00),

-- Venda 22 - Marcos Oliveira (Monitor)
(22, 4, 1, 1299.00),

-- Venda 23 - Juliana Rocha (Webcam + Mouse)
(23, 6, 1, 199.00),
(23, 2, 1, 89.90),

-- Venda 24 - Ana Silva (Notebook + Headset)
(24, 1, 1, 2999.00),
(24, 8, 1, 249.00),

-- Venda 25 - Comércio Rápido (Notebook x2 + Monitor x2 + Cadeira)
(25, 1, 2, 2999.00),
(25, 4, 2, 1299.00),
(25, 5, 1, 899.00),

-- Venda 26 - Carlos Mendes (Headset)
(26, 8, 1, 249.00),

-- Venda 27 - Loja Atacado Norte (Notebook x3 + Monitor x3 + Cadeira x3)
(27, 1, 3, 2999.00),
(27, 4, 3, 1299.00),
(27, 5, 3, 899.00),

-- Venda 28 - Distribuidora Sul (Notebook)
(28, 1, 1, 2999.00),

-- Venda 29 - Marcos Oliveira (Monitor + Teclado + Mouse)
(29, 4, 1, 1299.00),
(29, 3, 1, 259.00),
(29, 2, 1, 89.90),

-- Venda 30 - Juliana Rocha (Cadeira)
(30, 5, 1, 899.00);