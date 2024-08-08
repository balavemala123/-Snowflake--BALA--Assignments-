 CREATE OR REPLACE TABLE   TABLE_A   (NUM INT);

  CREATE OR REPLACE TABLE   TABLE_B   (NUM INT);


  INSERT INTO TABLE_A (NUM)  VALUES (1),
(2),
(4),
(5),
(6),
(7),
(8)


  INSERT INTO TABLE_B (NUM)  VALUES (1),
(3),
(4),
(6),
(9),
(8)

SELECT * FROM TABLE_A ;


SELECT * FROM TABLE_B ;

SELECT A.*,B.* 
     FROM  TABLE_A  A , TABLE_B B 
    WHERE A.NUM  = B.NUM 



SELECT X.*,Y.* 
     FROM  TABLE_A  X INNER JOIN TABLE_B Y
    ON X.NUM  = Y.NUM 



SELECT X.*,Y.* 
     FROM  TABLE_A  X LEFT JOIN TABLE_B Y
    ON X.NUM  = Y.NUM 



SELECT X.*,Y.* 
     FROM  TABLE_A  X RIGHT JOIN TABLE_B Y
    ON X.NUM  = Y.NUM 
    

SELECT X.*,Y.* 
     FROM  TABLE_A  X FULL JOIN TABLE_B Y
    ON X.NUM  = Y.NUM     


SHOW TABLES;



SELECT A.*,'||',B.*   
FROM EMPLOYEES A INNER JOIN DEPENDENTS  B 
  ON A.EMPLOYEE_ID = B.EMPLOYEE_ID


SELECT A.EMPLOYEE_ID
       ,A.FIRST_NAME
       ,A.EMAIL
       ,A.SALARY 
       ,B.FIRST_NAME
       ,B.RELATIONSHIP  
FROM EMPLOYEES A INNER JOIN DEPENDENTS  B 
  ON A.EMPLOYEE_ID = B.EMPLOYEE_ID


----A 40  -->   B.  30  


SELECT A.EMPLOYEE_ID
       ,A.FIRST_NAME
       ,A.EMAIL
       ,A.SALARY 
       ,B.FIRST_NAME
       ,B.RELATIONSHIP  
FROM EMPLOYEES A LEFT JOIN DEPENDENTS  B 
  ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
  
  

SELECT A.EMPLOYEE_ID
       ,A.FIRST_NAME
       ,A.EMAIL
       ,A.SALARY 
       ,B.FIRST_NAME
       ,B.RELATIONSHIP  
FROM EMPLOYEES A RIGHT JOIN DEPENDENTS  B 
  ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
  
  
SELECT A.EMPLOYEE_ID
       ,A.FIRST_NAME
       ,A.EMAIL
       ,A.SALARY 
       ,B.FIRST_NAME
       ,B.RELATIONSHIP  
FROM EMPLOYEES A FULL JOIN DEPENDENTS  B 
  ON A.EMPLOYEE_ID = B.EMPLOYEE_ID

  40+ 30 ==> 
  
	
	