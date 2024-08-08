CREATE or replace TABLE OUR_FIRST_DB.PUBLIC.LOAN_PAYMENT (
  Loan_ID STRING,
  loan_status STRING,
  Principal STRING,
  terms STRING,
  effective_date STRING,
  due_date STRING,
  paid_off_time STRING,
  past_due_days STRING,
  age STRING,
  education STRING,
  Gender STRING);


  select * from OUR_FIRST_DB.PUBLIC.LOAN_PAYMENT;

  --------------------1 min  --> 50 files -- 50 mins ----

	Stage can be internal/external locations .
	
	
	1) create internal stage 
	2) load data into stages 
	3) from stage you can copy into table 
	
	
	internal stages:
	-------------------
CREATE TABLE LOAN_PAYMENT_2 (
  Loan_ID STRING,
  loan_status STRING,
  Principal STRING,
  terms STRING,
  effective_date STRING,
  due_date STRING,
  paid_off_time STRING,
  past_due_days STRING,
  age STRING,
  education STRING,
  Gender STRING);

//create stage 
CREATE OR REPLACE STAGE MY_INTER_STAGE;

//load data into stage 
put file://D:\files\data.csv @MY_INTER_STAGE;

//describe satges 
list @MY_INTER_STAGE

//copy data from stages 
copy into LOAN_PAYMENT_2 from @MY_INTER_STAGE
file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1)


select * from LOAN_PAYMENT_2;



drop table LOAN_PAYMENT_2



























  