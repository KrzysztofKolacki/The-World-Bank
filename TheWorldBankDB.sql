-- Database: The World Bank

-- DROP DATABASE IF EXISTS "The World Bank";

CREATE DATABASE "The World Bank"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
-- Table: international_debt

-- DROP TABLE IF EXISTS international_debt;

CREATE TABLE international_debt
(
  country_name character varying(50),
  country_code character varying(50),
  indicator_name text,
  indicator_code text,
  debt numeric
);

-- Copy over data from CSV
copy international_debt FROM 'your_path\datasets\international_debt.csv' DELIMITER ',' CSV HEADER;