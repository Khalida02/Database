-- 1.
-- How can we store large-object types?
-- They are stored as a large object
--  blob: binary large object -- object is a large collection
--          of uninterpreted binary data (whose interpretation is left
--          to an application outside of the database system)
--  clob: character large object -- object is a large collection of character data


-- 2.
-- What is the difference between privilege, role and user?
-- Privileges control the ability to run SQL statements.
-- A role is a group of privileges.
-- A user is an individual person who is included in the role



-- a.
CREATE ROLE Accountant;
CREATE ROLE Administrator;
CREATE ROLE Support;

GRANT ALL ON accounts, transactions TO Accountant;
GRANT ALL ON accounts, customers, transactions TO Administrator;
GRANT SELECT ON customers TO Support;

-- b.
CREATE USER Khalida;
CREATE USER Azat;
CREATE USER Azamat;

GRANT Administrator TO Khalida;
GRANT Accountant TO Azat;
GRANT Support TO Azamat;

-- c.
ALTER USER Azamat CREATEROLE;

-- d.
REVOKE DELETE ON transactions FROM azat;


-- 3.
ALTER TABLE transactions ALTER COLUMN date SET NOT NULL ;
ALTER TABLE customers ALTER COLUMN name SET NOT NULL ;
ALTER TABLE accounts ALTER COLUMN currency SET NOT NULL ;


-- 5.
CREATE INDEX src_am ON accounts(customer_id, currency);
CREATE INDEX cur_bal ON accounts(currency, balance)


-- 6.
BEGIN;
UPDATE accounts
SET balance = balance + transactions.amount from transactions
WHERE account_id = transactions.dst_account AND transactions.status ='init';

UPDATE accounts
SET balance = balance - transactions.amount FROM transactions
WHERE account_id = transactions.src_account AND transactions.status = 'init' and (balance-transactions.amount) >= accounts."limit";
COMMIT ;
ROLLBACK ;