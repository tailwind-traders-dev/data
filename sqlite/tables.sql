create table stores (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT not null,
  owner TEXT not null,
  address TEXT not null,
  city TEXT not null,
  state TEXT not null,
  zip TEXT not null,
  created_at DATETIME not null default CURRENT_TIMESTAMP
);

create table suppliers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT not null,
  contact_email TEXT,
  ordering_endpoint TEXT
);

create table cart_items(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  session_id TEXT not null,
  product_id INTEGER not null references products(id),
  quantity INTEGER not null default 1,
  created_at DATETIME not null default CURRENT_TIMESTAMP,
  updated_at DATETIME not null default CURRENT_TIMESTAMP
);

create table collections (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT not null unique,
  name TEXT not null,
  image TEXT,
  description TEXT,
  created_at DATETIME not null default CURRENT_TIMESTAMP,
  updated_at DATETIME not null default CURRENT_TIMESTAMP
);

create table customers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_key TEXT not null default (lower(hex(randomblob(16)))),
  email TEXT not null,
  order_count INTEGER,
  created_at DATETIME not null default CURRENT_TIMESTAMP,
  updated_at DATETIME not null default CURRENT_TIMESTAMP
);

create table delivery_methods (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sku text not null,
  name text not null,
  arrival_window text,
  minutes_from_now integer,
  fee numeric
);

create table product_types (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT not null unique,
  name TEXT not null,
  description TEXT,
  image TEXT
);

create table products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sku TEXT not null unique,
  name TEXT not null,
  description text,
  product_type_id INTEGER not null references product_types(id),
  supplier_id INTEGER not null references suppliers(id),
  image TEXT,
  price REAL not null,
  unit_description TEXT,
  package_dimensions TEXT,
  weight_in_pounds TEXT,
  reorder_amount INTEGER default 10 not null,
  status TEXT default 'in-stock' not null,
  requires_shipping BOOLEAN not null default 1,
  warehouse_location TEXT,
  created_at DATETIME not null default CURRENT_TIMESTAMP,
  updated_at DATETIME not null default CURRENT_TIMESTAMP
);

create table shipments (
  number TEXT not null primary key default (lower(hex(randomblob(16)))),
  checkout_id TEXT not null references checkouts(number),
  delivery_method_id INTEGER not null references delivery_methods(id),
  status TEXT default 'in-process' not null,
  tracking_number TEXT,
  location TEXT,
  weight INTEGER not null default 0,
  dimensions TEXT
);

create table store_inventory (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_id INTEGER not null references products(id),
  store_id INTEGER not null references stores(id),
  units_in_stock INTEGER default 0 not null,
  units_on_order INTEGER default 0 not null
);

create table supply_orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  product_id INTEGER,
  store_id INTEGER not null references stores(id),
  supplier_id INTEGER,
  units_ordered INTEGER not null,
  status TEXT default 'ordered' not null,
  created_at DATETIME not null default CURRENT_TIMESTAMP
);


create table collections_products (
  id serial primary key,
  collection_id integer not null references collections(id),
  product_id integer not null references products(id)
);
