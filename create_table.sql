create table customer
	(
		cust_id varchar2(10) not null,
		cust_name varchar2(10) not null,
		cust_address varchar2(15) not null,
		cust_phone number(10) not null,
		cust_gender char(10) check(cust_gender IN('male','female')),
		constraint cust_pk primary key(cust_id)
		)
	/

create table orders
(
	cust_id varchar2(10) not null,
	order_id varchar2(10) not null,
	order_date date default getdate(),
	order_address varchar2(15) not null,
	order_city varchar2(10) not null,
	constraint order_pk primary key(order_id),
	constraint cust_fk foreign key(cust_id) references customer(cust_id)
)
/

create table payment_service_provider
(
	pcp_id varchar2(10) not null,
	pcp_name varchar2(10) not null,
	pcp_service varchar2(10) not null,
	constraint pcp_pk primary key(pcp_id)
)
/

create table payment
	(
		payment_id varchar2(10) not null,
		pcp_id varchar2(10) not null,
		order_id varchar2(10) not null,
		payment_mode varchar2(8) not null,
		payment_amount number(8) not null,
		constraint payment_pk primary key(payment_id),
		constraint pcp_fk foreign key(pcp_id) references payment_service_provider(pcp_id),
		constraint order_fk foreign key(order_id) references orders(order_id)
		)
/

create table supplier
	(
		supplier_id varchar2(10) not null,
		supplier_name varchar2(15) not null,
		supplier_address varchar2(15) not null,
		supplier_brand varchar2(10) not null,
		supplier_product_type varchar2(10) not null,
		constraint supplier_pk primary key(supplier_id)
		)
/

create table product
(
	supplier_id varchar2(10) not null,
	product_id varchar2(10) not null,
	product_name varchar2(15) not null,
	product_size varchar2(8),
	product_weight varchar2(5),
	product_color varchar2(8),
	product_price number(8) not null,
	constraint product_pk primary key(product_id),
	constraint supplier_fk foreign key(supplier_id) references supplier(supplier_id)
)	
/

create table product_quantity
	(
		product_id varchar2(10) not null,
		product_qty number(8) not null,
		constraint product_fk foreign key(product_id) references product(product_id)
		)
/

create table order_details
	(
		order_id varchar2(10) not null,
		product_id varchar2(10) not null,
		order_qty number(4) not null,
		order_amount number(8) not null,
		order_discount number(7) not null,
		order_net_discount number(10) not null,
		constraint order_fkey foreign key(order_id) references orders(order_id),
		constraint product_fkey foreign key(product_id) references product(product_id)
		)
	/