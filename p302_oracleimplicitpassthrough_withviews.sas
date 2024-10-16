/*Running Tasks on a Database table*/
libname oralib oracle path="sasbap:1521/XE" user=STUDENT pw="Metadata0"; 
options sastrace=',,t,d' sastraceloc=saslog nostsuffix; 
/*Proc FREQ on a Database table, generates in database SQL code for count and groupby processing*/
proc freq data=oralib.big_order_fact; 
table order_type; 
run; 

/*Using a view on the same oracle table doesn't generate the indatabase code*/
/*only a select order_type*/
PROC SQL;
	CREATE VIEW WORK.SORT AS
		SELECT t.order_type
	FROM oralib.big_order_fact as T
;
QUIT;
proc freq data=work.sort; 
table order_type; 
run; 