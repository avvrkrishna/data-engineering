--Change Role to SYSADMIN to Play DBA role
USE ROLE SYSADMIN;

--Create a new Database for the ETL project
CREATE DATABASE DBS_ANALYTICS;

--Create New Schema for each application separately
CREATE SCHEMA DBS_ANALYTICS.CALENDARS;
CREATE SCHEMA DBS_ANALYTICS.CUSTOMER;
CREATE SCHEMA DBS_ANALYTICS.PRODUCT;
CREATE SCHEMA DBS_ANALYTICS.GEOGRAPHY;
CREATE SCHEMA DBS_ANALYTICS.SALES;

--Stage schema to hold Stage tables and common objects
CREATE SCHEMA DBS_ANALYTICS.STAGE;

--Create File format for the required copying options
CREATE FILE FORMAT DBS_ANALYTICS.STAGE.MY_CSV 
    TYPE = 'CSV' 
    COMPRESSION = 'AUTO' 
    FIELD_DELIMITER = ',' 
    RECORD_DELIMITER = '\n' 
    SKIP_HEADER = 1;

--Change Role to Account Admin to create External Stage
USE ROLE ACCOUNTADMIN;

--Create External Stage Command Key Id and Secret Keys are masked for Security reasons
CREATE STAGE DBS_ANALYTICS.CALENDARS.AWS_ETL_ANALYTICS_STG 
URL = 's3://np-etl-stage' 
CREDENTIALS = 
    (AWS_KEY_ID = '********************' 
    AWS_SECRET_KEY = '****************************************');