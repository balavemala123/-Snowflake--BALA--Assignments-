


// Create storage integration object

create or replace storage integration s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::026090514423:role/bala-snowflake-11am-role'

  STORAGE_ALLOWED_LOCATIONS = ('s3://bala-snowflake/csv/', 's3://bala-snowflake/csv/')
   COMMENT = 'This an s3 integration object' 
   
   
// See storage integration properties to fetch external_id so we can update it in S3
DESC integration s3_int;





class notes:
---------------------

create or replace storage integration s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::024848483653:role/snow-vitech-11am-role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://vitech-snow11am-batch/csv/', 's3://vitech-snow11am-batch/csv/')
   COMMENT = 'This is an s3 integration object ' 



   --------------------------
create database MANAGE_DB;

create schema file_formats;

	DESC integration s3_int;


CREATE OR REPLACE stage stage_aws_csv
    URL = 's3://bala-snowflake/csv/'

    STORAGE_INTEGRATION = s3_int

  list @stage_aws_csv 

HR.EMP.DEPENDENTS
    
CREATE OR REPLACE file format MANAGE_DB.file_formats.csv_fileformat
    type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE    
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'  

copy into OUR_FIRST_DB.PUBLIC.dependent  
  from @stage_aws_csv 
file_format = (FORMAT_NAME  = MANAGE_DB.file_formats.csv_fileformat)
files =('dependent.csv')

select count(*)  from  OUR_FIRST_DB.PUBLIC.dependent;

select *  from  OUR_FIRST_DB.PUBLIC.dependent;
    
    -------------------------
create database OUR_FIRST_DB;
se
// Create table first
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.dependent (
 DEPENDENT_ID STRING,
 FIRST_NAME STRING,
 LAST_NAME STRING,
 RELATIONSHIP STRING,
 EMPLOYEE_ID STRING
 )