DROP TABLE IF EXISTS items;
CREATE TABLE items (
	item_id TEXT,
	item_name TEXT,
	item_category TEXT,
	brand TEXT,
	unit_measure TEXT,
	item_description TEXT,
	discontinued BOOLEAN
);

DROP TABLE IF EXISTS procurement_order;
CREATE TABLE procurement_order (
	po_id TEXT,
	item_id TEXT,
	supplier_id TEXT,
	order_date DATE,
	delivery_date DATE,
	quantity_ordered INT,
	unit_price NUMERIC(10,2),
	negotiated_price NUMERIC(10,2),
	currency TEXT,
	order_status TEXT,
	defective_units INT,
	compliance BOOLEAN,
	payment_terms TEXT
);

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers (
	supplier_id TEXT,
	supplier_name TEXT,
	country TEXT,
	contact_person TEXT,
	email TEXT,
	preferred BOOLEAN,
	rating INT	
);

DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
	item_id TEXT,
	current_stock INT,
	reorder_level INT,
	reorder_quantity INT,
	last_ordered_date DATE,
	lead_time INT,
	stock_status TEXT,
	warehouse_location TEXT
);

DROP TABLE IF EXISTS rate;
CREATE TABLE exchange_rate (
	currency TEXT,
	exchange_rate NUMERIC(10,2)
);

SELECT * from exchange_rate;
SELECT * from inventory;
SELECT * from items;
SELECT * from procurement_order;
SELECT * from suppliers;