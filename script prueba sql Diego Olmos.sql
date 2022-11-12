create schema if not exists `minimarket`;
#este esquema simplificado de un minimarket no tendra clientes guardados pero si en algun momento deseamos realizar campania de fidelidad esta la tabla para agregar datos
create table `minimarket`.`producto`(
`producto_id` int not null auto_increment,
`nombre` varchar(20) not null,
`tipo` varchar(25) not null,
`valor` int not null,
`unidades` int not null,
primary key (producto_id));

create table `minimarket`.`proveedor`(
`proveedor_id` int not null auto_increment,
`nombre` varchar(30) not null,
`rut` varchar(22) not null,
primary key (proveedor_id));

create table `minimarket`.`cliente`(
`cliente_id` int not null auto_increment,
`nombre` varchar(25),
primary key(cliente_id));
create table `minimarket`.`gasto`(
`gasto_id` int not null auto_increment,
`fecha` date not null,
`pagoLuz` int not null,
`cuotaHipoteca` int ,
primary key(gasto_id));


create table `minimarket`.`ordenInterna`(
`ordenInterna_id` int not null auto_increment,
`producto_id` int,
`cantidad` int not null,
`proveedor_id` int,
`valor` int not null,
`fecha` date not null,
`gasto_id` int not null,
primary key(ordenInterna_id),
constraint FK_productoOrden foreign key (producto_id)
references producto(producto_id),
constraint FK_proveedorOrden foreign key (proveedor_id)
references proveedor(proveedor_id),
constraint FK_gastoOrden foreign key (gasto_id)
references gasto(gasto_id));

create table `minimarket`.`boleta`(
`boleta_id` int not null auto_increment,
`producto_id` int,
`cliente_id` int,
`monto` int not null,
`medioPago` varchar(25),
`fecha` date not null,
primary key (boleta_id),
constraint FK_productoBoleta foreign key (producto_id)
references producto(producto_id),
constraint FK_clienteBoleta foreign key (cliente_id)
references cliente(cliente_id));



insert into minimarket.producto(nombre, tipo, valor, unidades) values ('Yogurth mora 1L', 'Lacteos', 1000, 7);
insert into minimarket.producto(nombre, tipo, valor, unidades) values ('quix 400ml', 'Limpieza', 1500, 10);
insert into minimarket.producto(nombre, tipo, valor, unidades) values ('chupete cereza', 'Dulces', 200, 40);
insert into minimarket.producto(nombre, tipo, valor, unidades) values ('Papas fritas', 'Snacks', 700, 20);
insert into minimarket.producto(nombre, tipo, valor, unidades) values ('Kem Xtreme 1.5L', 'Bebidas', 1890, 14);
select*from minimarket.producto;
insert into minimarket.proveedor(nombre, rut) values ('CoreImports','40987376-7');
select*from minimarket.proveedor;
insert into minimarket.gasto (fecha, pagoLuz, cuotaHipoteca) values ('2022-11-11', 24500, 250000);
select * from minimarket.gasto;
insert into minimarket.ordenInterna(producto_id, cantidad, proveedor_id, valor, fecha, gasto_id) values (1, 7, 1, 600, '2022-11-11',1);
insert into minimarket.ordenInterna(producto_id, cantidad, proveedor_id, valor, fecha, gasto_id) values (2, 10, 1, 800, '2022-11-11',1);
insert into minimarket.ordenInterna(producto_id, cantidad, proveedor_id, valor, fecha, gasto_id) values (3, 40, 1, 50, '2022-11-11',1);
insert into minimarket.ordenInterna(producto_id, cantidad, proveedor_id, valor, fecha, gasto_id) values (4, 20, 1, 330, '2022-11-11',1);
insert into minimarket.ordenInterna(producto_id, cantidad, proveedor_id, valor, fecha, gasto_id) values (5, 14, 1, 1000, '2022-11-11',1);
select*from minimarket.ordeninterna;
insert into minimarket.cliente(nombre) values ('Zyra');
select*from minimarket.cliente;
insert into minimarket.boleta(producto_id, cliente_id, monto, medioPago, fecha) values (4, 1, 700, 'efectivo','2022-11-11');
select*from minimarket.boleta;


use minimarket;
#con esta consulta tenemos los gastos el producto que vendimos el valor al cual lo compramos y el valor al cual lo vendimos con el monto total de la boleta
select gasto.PagoLuz, gasto.cuotaHipoteca, ordenInterna.producto_id, ordenInterna.valor, boleta.monto
from ordenInterna inner join gasto
on ordenInterna.gasto_id = gasto.gasto_id
inner join boleta
on ordenInterna.producto_id = boleta.producto_id;