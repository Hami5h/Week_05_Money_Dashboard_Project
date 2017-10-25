DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE tags(
  id SERIAL8 primary key,
  item_type VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 primary key,
  amount INT8,
  item_name VARCHAR(255) not null,
  merchant_id INT8 references merchants(id) ON DELETE CASCADE,
  tag_id INT8 references tags(id) ON DELETE CASCADE
);
