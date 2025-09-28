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
COPY INTO EXERCISE_DB.PUBLIC.CUSTOMERS
FROM
    's3://snowflake-assignments-mc/gettingstarted/customers.csv' FILE_FORMAT = (
        type = csv,
        field_delimiter = ',',
        skip_header = 1
    ) ON_ERROR = 'CONTINUE';
SELECT
    *
FROM
    EXERCISE_DB.PUBLIC.CUSTOMERS;
SELECT
    COUNT(*)
FROM
    EXERCISE_DB.PUBLIC.CUSTOMERS;
DROP DATABASE EXERCISE_DB;