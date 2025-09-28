CREATE DATABASE EXERCISE_DB;
CREATE
OR REPLACE TABLE EXERCISE_DB.PUBLIC.CUSTOMERS (
    ID INT,
    first_name varchar,
    last_name varchar,
    email varchar,
    age int,
    city varchar
);
CREATE
OR REPLACE STAGE EXERCISE_DB.PUBLIC.CUSTOMERS_STAGE url = 's3://snowflake-assignments-mc/loadingdata/';
LIST @EXERCISE_DB.PUBLIC.CUSTOMERS_STAGE;
COPY INTO EXERCISE_DB.PUBLIC.CUSTOMERS
FROM
    @EXERCISE_DB.PUBLIC.CUSTOMERS_STAGE file_format = (type = csv field_delimiter = ';' skip_header = 1);
SELECT
    COUNT(*)
FROM
    EXERCISE_DB.PUBLIC.CUSTOMERS;
DROP DATABASE EXERCISE_DB;