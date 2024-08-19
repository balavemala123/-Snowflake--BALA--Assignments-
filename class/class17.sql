TASK :  
----s3://bala-snowflake/json/

// Create storage integration object

create or replace storage integration s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::026090514423:role/bala-snowflake-11am-role'


  STORAGE_ALLOWED_LOCATIONS = ('s3://bala-snowflake/json/')

   COMMENT = 'This an s3 integration object' 
   
   
// See storage integration properties to fetch external_id so we can update it in S3
DESC integration s3_int;





class notes:
---------------------

   --------------------------
create database MANAGE_DB;
create database OUR_FIRST_DB;
create schema file_formats;

	DESC integration s3_int;


CREATE OR REPLACE stage  MANAGE_DB.FILE_FORMATS.stage_aws_json
    URL = 's3://bala-snowflake/json/'

    STORAGE_INTEGRATION = s3_int

  list @MANAGE_DB.FILE_FORMATS.stage_aws_json;




  
    
CREATE OR REPLACE file format MANAGE_DB.FILE_FORMATS.JSONFORMAT
    TYPE = 'JSON';





    
 
copy into OUR_FIRST_DB.PUBLIC.MUSICAL_INSTRUMENT 
from @MANAGE_DB.FILE_FORMATS.stage_aws_json
file_format = (FORMAT_NAME = MANAGE_DB.file_formats.json_fileformat)
files =('Musical_Instruments_5.json');


 

select count(*)  from  OUR_FIRST_DB.PUBLIC.MUSICAL_INSTRUMENT;

select *  from  OUR_FIRST_DB.PUBLIC.MUSICAL_INSTRUMENT;
    
    -------------------------
create database OUR_FIRST_DB;
se
// Create table first
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.MUSICAL_INSTRUMENT (
 raw_file variant);
 

