-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table client(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit varchar(3),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
);
desc client;
-- criar tabela produto
create table product(
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        Classification_kids bool default false,
        Category enum('Eletronic', 'Clothes', 'Toys', 'Foods', 'Books') not null,
        Avaliation float default 0,
        Size varchar(10)
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum ('Canceled', 'Confirmed', 'In process') default 'In process',
    orderDescription varchar (255),
    sendValue float default 10,
    constraint fk_ordes_client foreign key (idOrderClient) references client(idClient)
);

-- criar tabela de estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar (255),
    quantity int default 0
);

-- criar tabela de fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar (255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela de Vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar (255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    contact char(11) not null,
    constraint unique_cpf_seller unique (CNPJ)
);

create table productSeller(
	idPseller int ,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);
create table clientPF(
    idClient int primary key,
    birthDate date,
    constraint fk_client_pf foreign key (idClient) references client(idClient)
);

create table clientPJ(
    idClient int primary key,
    companyName varchar(255),
    CNPJ char(15),
    constraint fk_client_pj foreign key (idClient) references client(idClient)
);

-- para pedidos com multiplos produtos
create table orderProduct(
    idOrder int,
    idProduct int,
    quantity int,
    primary key (idOrder, idProduct),
    constraint fk_order_product_order foreign key (idOrder) references orders(idOrder),
    constraint fk_order_product_product foreign key (idProduct) references product(idProduct)
);

-- tabela para entrega
create table delivery (
	idDelivery int auto_increment primary key,
    trackingCode varchar(45),
    deliveryStatus enum ('Pending', 'Shipped', 'Delivered', 'Canceled') default 'Pending'
);

-- tabela pagamentos para permitir varias formas de pagamento por cliente
create table payment(
	idPayment int auto_increment primary key,
    idClient int,
    paymentMethod varchar(45),
    creditCardCode char(16),
    constraint fk_payment_client foreign key (idClient) references client (idClient)
);

-- alterando a tabela orders para ter relações com pay e delivery
alter table orders
add column idPayment int,
add column idDelivery int,
add constraint fk_orders_payment foreign key (idPayment) references payment(idPayment),
add constraint fk_orders_delivery foreign key (idDelivery) references delivery(idDelivery);

-- relacionando product com supplier
alter table product
add column idSupplier int,
add constraint fk_product_supplier foreign key (idSupplier) references supplier(idSupplier);

-- corrigindo erro em seller
alter table seller
drop constraint unique_cpf_seller,
add constraint unique_cnpj_seller unique (CNPJ),
add constraint unique_cpf_seller unique (CPF);


-- insert data for tests
-- 1️⃣ CLIENTES
insert into client (Fname, Minit, Lname, CPF, Address) values
('João', 'A', 'Silva', '12345678901', 'Rua A, 100'),
('Maria', 'B', 'Oliveira', '23456789012', 'Rua B, 200'),
('Carlos', 'C', 'Souza', '34567890123', 'Rua C, 300');

-- 2️⃣ CLIENTE PF
insert into clientPF (idClient, birthDate) values
(1, '1990-05-10'),
(2, '1985-08-22');

-- 3️⃣ CLIENTE PJ
insert into clientPJ (idClient, companyName, CNPJ) values
(3, 'Tech Solutions', '11222333444455');

-- 4️⃣ FORNECEDORES
insert into supplier (socialName, CNPJ, contact) values
('Fornecedor A', '55666777888899', '44999990001'),
('Fornecedor B', '66777888999900', '44999990002');

-- 5️⃣ PRODUTOS (já com fornecedor)
insert into product (Pname, Classification_kids, Category, Avaliation, Size, idSupplier) values
('Notebook', false, 'Eletronic', 4.5, '15pol', 1),
('Camiseta', true, 'Clothes', 4.0, 'M', 2),
('Boneca', true, 'Toys', 4.8, '30cm', 2);

-- 6️⃣ ESTOQUE
insert into productStorage (storageLocation, quantity) values
('Centro de Distribuição SP', 100),
('Centro de Distribuição PR', 50);

-- 7️⃣ PRODUTO EM ESTOQUE
insert into stockProduct (idProdStorage, idProduct, stockQuantity) values
(1, 1, 30),
(1, 2, 50),
(2, 3, 20);

-- 8️⃣ VENDEDORES
insert into seller (socialName, abstName, CNPJ, CPF, contact) values
('Vendas Rápidas', 'VR', '99888777666554', null, '44999990003'),
('Comércio XYZ', null, null, '45678901234', '44999990004');

-- 9️⃣ PRODUTOS POR VENDEDOR
insert into productSeller (idPseller, idProduct, prodQuantity) values
(1, 1, 5),
(1, 2, 10),
(2, 3, 8);

-- 🔟 PAGAMENTOS
insert into payment (idClient, paymentMethod, creditCardCode) values
(1, 'Cartão de Crédito', '1111222233334444'),
(2, 'Boleto', null),
(3, 'Pix', null);

-- 1️⃣1️⃣ ENTREGAS
insert into delivery (trackingCode, deliveryStatus) values
('BR123456789', 'Shipped'),
('BR987654321', 'Pending');

-- 1️⃣2️⃣ PEDIDOS (já com pagamento e entrega)
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, idPayment, idDelivery) values
(1, 'Confirmed', 'Compra de notebook', 20, 1, 1),
(2, 'In process', 'Compra de camiseta e boneca', 15, 2, 2);

-- 1️⃣3️⃣ PRODUTOS POR PEDIDO
insert into orderProduct (idOrder, idProduct, quantity) values
(1, 1, 1),
(2, 2, 2),
(2, 3, 1);

-- Quantos pedidos cada cliente já fez?
-- seleciona nome e faz um contador de id ordem da tabela client fazendo um left join para agrupar os clientes que tenham ordem de pedidos
select 
    concat(c.Fname, ' ', c.Lname) as cliente,
    count(o.idOrder) as total_pedidos
from client c
left join orders o 
    on c.idClient = o.idOrderClient
group by c.idClient, c.Fname, c.Lname
order by total_pedidos desc;



-- Algum vendedor tbm é cliente?
-- pega i social nome e o cnpj da tabela seller e junta com os da tabela supplier que possuem o msm cnpj
select 
    s.socialName as nome_vendedor_fornecedor,
    s.CNPJ
from seller s
join supplier sp 
    on s.CNPJ = sp.CNPJ;

-- relaçao fornecedor produto
select 
    sup.socialName as fornecedor,
    p.Pname as produto
from supplier sup
join product p on sup.idSupplier = p.idSupplier
order by fornecedor, produto;
