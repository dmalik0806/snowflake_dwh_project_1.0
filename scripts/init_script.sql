/*
======= Create Database, Schemas and file format ============
Purpose: This script checks and creates a new database 'snowflake_dwh' if it does not exists.
         Schemas, 'landing_zone', 'curated_zone' and 'consumption_zone' are created.
         To ingest the data into landing_zone schema, created a file format 'landing_zone_csv_format'
*/
create database if not exists snowflake_dwh;

create schema if not exists landing_zone;
create schema if not exists curated_zone;
create schema if not exists consumption_zone;

use schema landing_zone;
create file format landing_zone_csv_format
    type = 'csv'
    compression = 'auto'
    field_delimiter = ','
    record_delimiter = '\n'
    skip_header = 1
    field_optionally_enclosed_by = '\042'
    null_if = ('\\N');

