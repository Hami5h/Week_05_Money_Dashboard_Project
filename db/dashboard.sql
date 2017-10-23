DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE transactions;

CREATE TABLE merchants
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
);

CREATE TABLE tags
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
);

CREATE TABLE transactions
(
  id SERIAL8 primary key,
  amount INT8,
  merchant_id INT8 references merchants(id),
  tag_id INT8 references tags(id)
);
