CREATE DATABASE EXERCISE_DB;
CREATE
OR REPLACE STAGE EXERCISE_DB.PUBLIC.JSON_STAGE url = 's3://snowflake-assignments-mc/unstructureddata/';
CREATE
OR REPLACE file format EXERCISE_DB.PUBLIC.FILE_FORMAT TYPE = 'JSON';
CREATE
OR REPLACE TABLE EXERCISE_DB.PUBLIC.JSON_RAW (raw variant);
COPY INTO EXERCISE_DB.PUBLIC.JSON_RAW
FROM
    @EXERCISE_DB.PUBLIC.JSON_STAGE file_format = EXERCISE_DB.PUBLIC.FILE_FORMAT;
SELECT
    *
FROM
    EXERCISE_DB.PUBLIC.JSON_RAW
LIMIT
    1;
SELECT
    RAW:first_name::string as first_name,
    RAW:last_name::string as last_name,
    RAW:Skills [0]::string as skills_1,
    RAW:Skills [1]::string as skills_2,
FROM
    EXERCISE_DB.PUBLIC.JSON_RAW;
CREATE
    OR REPLACE TABLE EXERCISE_DB.PUBLIC.SKILLS (
        first_name varchar,
        last_name varchar,
        skills_1 varchar,
        skills_2 varchar
    );
INSERT INTO
    EXERCISE_DB.PUBLIC.SKILLS (first_name, last_name, skills_1, skills_2)
SELECT
    RAW:first_name::string as first_name,
    RAW:last_name::string as last_name,
    RAW:Skills [0]::string as skills_1,
    RAW:Skills [1]::string as skills_2
FROM
    EXERCISE_DB.PUBLIC.JSON_RAW;
SELECT
    *
FROM
    EXERCISE_DB.PUBLIC.SKILLS
WHERE
    FIRST_NAME = 'Florina';
DROP DATABASE EXERCISE_DB;