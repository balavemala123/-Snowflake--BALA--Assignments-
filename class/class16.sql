JSON -->  variant  Data Type 
  
  
  S3 --> json 
    Create s3 integration 
	 config in trust policy 
	 Stage 
	   load -> Variant   table 
	   Extract 
	     json to structured 
		 
		 
		 
{
  "city": "Bakersfield",
  "first_name": "Portia",
  "gender": "Male",
  "id": 1,
  "job": {
    "salary": 32000,
    "title": "Financial Analyst"
  },
  "last_name": "Gioani",
  "prev_company": [],
  "spoken_languages": [
    {
      "language": "Kazakh",
      "level": "Advanced"
    },
    {
      "language": "Lao",
      "level": "Basic"
    }
  ]
}		 
		 
		 
----------------------------
{
  "__index_level_0__": 7,
  "cat_id": "HOBBIES",
  "d": 489,
  "date": 1338422400000000,
  "dept_id": "HOBBIES_1",
  "id": "HOBBIES_1_008_CA_1_evaluation",
  "item_id": "HOBBIES_1_008",
  "state_id": "CA",
  "store_id": "CA_1",
  "value": 12
  
  
  
  
  
  
  
  1) Today's class 
  2) Parquet file to structured 
  3) Musical Json file to load as Structured format using AWS S3
  4) create another bucket and load empoloyee.csv file and store data into snowflake 
     
	  as a developer i need to create S3 bucket
  
  
  
  
}

class notes:
---------------
CREATE SCHEMA EXTERNAL_STAGES 

// First step: Load Raw JSON



CREATE OR REPLACE stage MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE
     url='s3://bucketsnowflake-jsondemo';

LIST @MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE

CREATE OR REPLACE file format MANAGE_DB.FILE_FORMATS.JSONFORMAT
    TYPE = JSON;

   
    
CREATE OR REPLACE table OUR_FIRST_DB.PUBLIC.JSON_RAW (
    raw_file variant);
    
COPY INTO OUR_FIRST_DB.PUBLIC.JSON_RAW
    FROM @MANAGE_DB.EXTERNAL_STAGES.JSONSTAGE
    file_format= MANAGE_DB.FILE_FORMATS.JSONFORMAT
    files = ('HR_data.json');
    
   
SELECT * FROM OUR_FIRST_DB.PUBLIC.JSON_RAW;



SELECT $1:city
       ,$1:first_name
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW



SELECT raw_file:city :: String    as city
       ,raw_file:first_name :: String as fname
       ,raw_file:job.salary :: int as salary 
       ,raw_file:job.title :: String as title 
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW 

create or replace table hrdtls as (

SELECT raw_file: id :: int as sid,
raw_file:city :: String    as city
       ,raw_file:first_name :: String as fname
       ,raw_file:job.salary :: int as salary 
       ,raw_file:job.title :: String as title 
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW )


select * from hrdtls 

select min(salary) from hrdtls

create or replace table languages as (
SELECT 
raw_file: id :: int as sid,
raw_file:spoken_languages[0].language :: string as first_language
,raw_file:spoken_languages[0].level  :: string as first_lan_level,
raw_file:spoken_languages[1].language :: string as sec_language,
raw_file:spoken_languages[1].level :: string as sec_lan_level
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW 

    )  
select * from hrdtls;
    select * from languages;

select A.* , B.* from hrdtls A inner join languages B  
                on A.sid = B.sid 

select A.* , B.* 
    from hrdtls A , languages B  
            where  A.sid = B.sid 

--------------

    // Create file format and stage object
    
CREATE OR REPLACE FILE FORMAT MANAGE_DB.FILE_FORMATS.PARQUET_FORMAT
    TYPE = 'parquet';

CREATE OR REPLACE STAGE MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE
    url = 's3://snowflakeparquetdemo'   
    FILE_FORMAT = MANAGE_DB.FILE_FORMATS.PARQUET_FORMAT;
    
    
    // Preview the data
    
LIST  @MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE;   
    
SELECT * FROM @MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE;

                
SELECT $1:dept_id :: string  as deptid
,$1:item_id  :: string as itemid
,$1:state_id  :: string as stateid
,$1:store_id   :: string as storeid
,$1:cat_id :: string as catid
,$1:d :: int as d
,$1:value  :: int    as value
, $1:id  :: string    as id
,$1:__index_level_0__  :: int as indexlevel
,to_timestamp($1:date :: varchar)  as date                                                   
FROM @MANAGE_DB.EXTERNAL_STAGES.PARQUETSTAGE;


----- 2024-08-09 11:05:19.012
                
  select sysdate();
	 
			