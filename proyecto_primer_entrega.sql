create database proyecto;
use proyecto;

create table sucursales(
id_sucursal int auto_increment not null,
nombre varchar (20) not null,
direccion varchar (20) not null,
ciudad varchar (20) not null,
telefono int (15) ,
primary key (id_sucursal)
);

create table actividades(
id_actividad int auto_increment not null,
nombre_act varchar(20) not null,
primary key (id_actividad)
);

create table clientes (
id_cliente int auto_increment not null,
nombre varchar(20) not null,
apellido varchar (20) not null,
dni int (8) not null,
telefono int(10),
id_sucursal int,
id_actividad int,
foreign key (id_actividad) references actividades(id_actividad),
foreign key (id_sucursal) references sucursales(id_sucursal),
primary key (id_cliente)
);

create table puestos(
id_puesto int auto_increment not null,
puesto varchar(20) not null,
primary key (id_puesto)
);

create table empleados(
id_empleado int auto_increment not null,
nombre varchar(20)not null,
apellido varchar (20)not null,
dni int(8)not null,
id_puesto int not null,
id_sucursal int not null,
primary key (id_empleado),
foreign key(id_sucursal) references sucursales (id_sucursal),
foreign key (id_puesto) references puestos(id_puesto)
);

create table proveedores(
id_proveedor int auto_increment not null,
nombre varchar (20) not null,
apellido varchar (20) not null,
telefono int(12),
primary key (id_proveedor)
);

create table productos (
id_producto int auto_increment not null,
nombre varchar(20) not null,
precio real not null,
id_proveedor int not null,
primary key (id_producto),
foreign key (id_proveedor) references proveedores (id_proveedor)
);

create table metodo_pago(
id_metodo_pago int auto_increment not null,
m_pago varchar(20) not null,
primary key (id_metodo_pago)
);

create table ventas (
id_venta int auto_increment not null,
fecha date not null,
cantidad int (10) not null,
id_metodo_pago int not null,
id_cliente int not null,
id_producto int not null,
primary key (id_venta),
foreign key (id_metodo_pago) references metodo_pago (id_metodo_pago),
foreign key (id_cliente) references clientes (id_cliente),
foreign key (id_producto) references productos(id_producto)
);

create table inventario (
id_inventario int auto_increment not null,
cantidad_disponible int(3) not null,
id_producto int not null,
id_sucursal int not null,
primary key (id_inventario), 
foreign key (id_producto) references productos(id_producto),
foreign key (id_sucursal) references sucursales (id_sucursal)
);

create table clientes_subs(
id_subscripcion int auto_increment not null,
fecha_inicio date not null,
fecha_fin date not null,
id_cliente int not null,
primary key (id_subscripcion),
foreign key (id_cliente) references clientes(id_cliente)
);


create table pagos (
id_pago int auto_increment not null,
id_cliente int not null,
id_metodo_pago int not null,
monto real not null,
fecha date not null,
primary key (id_pago),
foreign key (id_metodo_pago) references metodo_pago (id_metodo_pago),
foreign key (id_cliente) references clientes(id_cliente)
);
