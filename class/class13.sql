
TASK: Pracice today's class 
install git & Git hub creation 
push all the assignments (Repo )   < Snowflake-<Name>-Assigments >
Create AWS account 

https://youtu.be/9jmpos7qYL4
								
		GIT & Git hub 

 Git : version controle tool 

 Git hub : Code repository (cloud platform) 
 

   stages --> 100 sQL 
              
           person - B --> copy 200 SQLs 
                  (We need to keep all files in to single place )

     Crashed --> 20 days -->   	(5 days leave)
	 
	
   Azure Repos --> Microsoft account 
   Bit bucket 
   Git labs    
   
   
   Git -->  https://youtu.be/o1YDW_jnvvk?si=ynwv9iWVPNGKdrW3 
   
    Create github account 
	git software 
   
   
    AWS account --> https://youtu.be/CCaVgwVGlt8?si=W8-vTLXQWeC1O4aV  
	
             	 
class SQLs:
-------------
   
---- Use files with errors ----
CREATE OR REPLACE STAGE COPY_DB.PUBLIC.aws_stage_copy
    url='s3://snowflakebucket-copyoption/returnfailed/';

LIST @COPY_DB.PUBLIC.aws_stage_copy;    



COPY INTO COPY_DB.PUBLIC.ORDERS
    FROM @aws_stage_copy
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*'
    VALIDATION_MODE = RETURN_ERRORS



COPY INTO COPY_DB.PUBLIC.ORDERS
    FROM @aws_stage_copy
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*'
    VALIDATION_MODE = RETURN_1_rows
    



-------------- Working with error results -----------

---- 1) Saving rejected files after VALIDATION_MODE ---- 

CREATE OR REPLACE TABLE  COPY_DB.PUBLIC.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT VARCHAR(30),
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));


COPY INTO COPY_DB.PUBLIC.ORDERS
    FROM @aws_stage_copy
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*'
 --- VALIDATION_MODE = RETURN_ERRORS
  
    ON_ERROR =CONTINUE 

   select count(*)  from ORDERS;  --> 4781   + 4 == 4785  

// Storing rejected /failed results in a table
CREATE OR REPLACE TABLE rejected AS 
select rejected_record from table(result_scan(last_query_id()));

INSERT INTO rejected
select rejected_record from table(result_scan(last_query_id()));

SELECT * FROM rejected;




---- 2) Saving rejected files without VALIDATION_MODE ---- 





COPY INTO COPY_DB.PUBLIC.ORDERS
    FROM @aws_stage_copy
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*'
    ON_ERROR=CONTINUE
  
  
select * from table(validate(orders, job_id => '_last'));


---- 3) Working with rejected records ---- 



SELECT REJECTED_RECORD FROM rejected;

CREATE OR REPLACE TABLE rejected_values as
SELECT 
SPLIT_PART(rejected_record,',',1) as ORDER_ID, 
SPLIT_PART(rejected_record,',',2) as AMOUNT, 
SPLIT_PART(rejected_record,',',3) as PROFIT, 
SPLIT_PART(rejected_record,',',4) as QUANTITY, 
SPLIT_PART(rejected_record,',',5) as CATEGORY, 
SPLIT_PART(rejected_record,',',6) as SUBCATEGORY
FROM rejected; 

select count(*) from orders; 

insert into orders (

SELECT * FROM rejected_values)


update rejected_values  
    set profit = 244
where profit =  '-244'



update rejected_values  
    set quantity = 7
where quantity =  '7-'


				