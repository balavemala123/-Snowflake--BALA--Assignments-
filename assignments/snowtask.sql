create or replace storage integration s3_int_pipe
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::026090514423:role/snow-task'
  STORAGE_ALLOWED_LOCATIONS = ('s3://task-snowflake/csv1/')
   COMMENT = 'This is snow pipe' 
   
   
// See storage integration properties to fetch external_id so we can update it in S3
DESC integration s3_int_pipe;




// Create table first
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.dependent (
 DEPENDENT_ID int,
 FIRST_NAME STRING,
 LAST_NAME STRING,
 RELATIONSHIP STRING,
 EMPLOYEE_ID int
 )

    

// Create file format object
CREATE OR REPLACE file format MANAGE_DB.file_formats.csv1_fileformat
    type ='csv'
    field_delimiter = ','
    skip_header =1
    null_if = ('NULL','null')
    empty_field_as_null = false;
    
    
 // Create stage object with integration object & file format object
CREATE OR REPLACE stage MANAGE_DB.external_stages.csv1_folder
    URL = 's3://task-snowflake/csv1/'
    STORAGE_INTEGRATION = s3_int_pipe
    FILE_FORMAT = MANAGE_DB.file_formats.csv_fileformat
   

 // Create stage object with integration object & file format object
LIST @MANAGE_DB.external_stages.csv1_folder  


// Create schema to keep things organized
CREATE OR REPLACE SCHEMA MANAGE_DB.pipes

// Define pipe
CREATE OR REPLACE pipe MANAGE_DB.pipes.dependent_pipe
auto_ingest = TRUE
AS
COPY INTO OUR_FIRST_DB.PUBLIC.dependent 
FROM @MANAGE_DB.external_stages.csv1_folder  

// Describe pipe
DESC pipe dependent_pipe
    
SELECT * FROM OUR_FIRST_DB.PUBLIC.dependent   

ALTER pipe dependent_pipe refresh;


----------------------------------------------



-- Manage pipes -- 

DESC pipe MANAGE_DB.pipes.dependent_pipe;

SHOW PIPES;

SHOW PIPES like '%dependent%'

SHOW PIPES in database MANAGE_DB

SHOW PIPES in schema MANAGE_DB.pipes

SHOW PIPES like '%dependent%' in Database MANAGE_DB


-- Changing pipe (alter stage or file format) --


// Pause pipe
ALTER PIPE MANAGE_DB.pipes.dependent_pipe SET PIPE_EXECUTION_PAUSED = true

ALTER PIPE MANAGE_DB.pipes.dependent_pipe SET PIPE_EXECUTION_PAUSED = false
 
// Verify pipe is paused and has pendingFileCount 0 
SELECT SYSTEM$PIPE_STATUS('MANAGE_DB.pipes.orders_pipe') 
 
 // Recreate the pipe to change the COPY statement in the definition
CREATE OR REPLACE pipe MANAGE_DB.pipes.dependent_pipe
auto_ingest = TRUE
AS
COPY INTO OUR_FIRST_DB.PUBLIC.dependent
FROM @MANAGE_DB.external_stages.csv_folder  

ALTER PIPE  MANAGE_DB.pipes.dependent_pipe refresh



// Resume pipe
ALTER PIPE MANAGE_DB.pipes.dependent_pipe SET PIPE_EXECUTION_PAUSED = false

// Verify pipe is running again
SELECT SYSTEM$PIPE_STATUS('MANAGE_DB.pipes.dependent_pipe') 

---------------------------------------------------------------------
// Snowpipe error message
SELECT * FROM TABLE(VALIDATE_PIPE_LOAD(
    PIPE_NAME => 'MANAGE_DB.pipes.employee_pipe',
    START_TIME => DATEADD(HOUR,-2,CURRENT_TIMESTAMP())))

    
select sysdate();
// COPY command history from table to see error massage

SELECT * FROM TABLE (INFORMATION_SCHEMA.COPY_HISTORY(
   table_name  =>  'OUR_FIRST_DB.PUBLIC.EMPLOYEES',
   START_TIME =>DATEADD(HOUR,-2,CURRENT_TIMESTAMP())))


