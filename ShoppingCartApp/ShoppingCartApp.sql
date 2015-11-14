CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  price INTEGER NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE shopping_cart_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  product_id INTEGER NOT NULL,
  acquisition_price INTEGER NOT NULL,
  quantity INTEGER NOT NULL
);
CREATE UNIQUE INDEX index_on_product_id ON shopping_cart_items (product_id);

INSERT INTO products VALUES(NULL, 34, 'Printer paper (10-ream case)');
INSERT INTO products VALUES(NULL,  7, 'Stapler');
INSERT INTO products VALUES(NULL,  6, 'Box of 100 paper clips');
INSERT INTO products VALUES(NULL, 24, 'Toner cartridge');
INSERT INTO products VALUES(NULL,  6, 'USB stick 8GB');
INSERT INTO products VALUES(NULL, 11, 'USB stick 16GB');
INSERT INTO products VALUES(NULL,  5, 'Box of 60 ball point pens');

