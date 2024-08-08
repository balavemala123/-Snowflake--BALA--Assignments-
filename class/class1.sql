   Session-1
								--------------------------
								
				Database 
				Schema 
				SQL 
				What is the road map for SQL 
				
				Tables & insert / bulk insert /load 
				

Database :	It is a storage location , we can store data ( structured , semi structured , un structured data)
            It is a collection of data 
          
		    create user -->  api -->  database 
		   instagram -->  fetch --> data base 
		   xyz organization -->   employee / sales ...etc 
		   
          EX:   Create database   <database name > Ecomm /bank / 
			
Schema : Logicla structure of the data 

      BANK 
	  
	  Hdfc -->   customer , employee , loan 
	  
	  Icic -> customer , employee , loan 
	  
	  with in same databse we can't create duplicate tables 
	  
	  
	  first we need to create schema then you can create tables 
	  
	ex:  create schema  sbi 
	  
SQL : Structured query language    --> sql is not a database 
      In order to communicate with any database we are going to SQL 
	  C --> Create   database /schema /cretae table /insert data  
	  R --> Read   fetch 
	  U --> update 
	  D --> Delete 
	  
	  Data manipulations 
	  
	  Its like common english language 
	  
	 Databses or RDBMS 
	 
	 Mysql 
	 oracle 
	 postgrage 
	 sybase 
	 mangodb 
	 Cosmos
     snowflake 	 
	 
	 
	 whats app group 
	 
	 sunday EOD 
	 
	create database bank;

//ctrl + enter or 


create table  bank.hdfc.employee (empid   number,empname string);

create table  bank.sbi.employee (empid   number,empname string,salary int);

create schema sbi ;

create schema hdfc ;



show tables;



use database vitech;

use database bank;


Loan_ID	loan_status	Principal	terms	effective_date	due_date	paid_off_time	past_due_days	age	education	Gender