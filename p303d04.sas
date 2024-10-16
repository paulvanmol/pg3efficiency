options fullstimer;

libname orstar cvp "&path\orstar"; 
libname orfmt "&path\orfmt"; 
proc sql; 
create table work.customerdim as
select Customer_id as customerid,customer_name as customername,
customer_age as customerage,
customer_age_group as customeragegroup, 
customer_group as customergroup,
Customer_country as customercountry,
customer_type as customertype,
customer_gender as customerGender,
customer_birthdate as customerbirthdate,
customer_firstname as customerfirstname,
customer_lastname as customerlastname
from orstar.customer_dim; 
quit; 
proc contents data=work.customerdim; 
run; 

data work.customerdim; 
set work.customerdim; 
do i=1 to 100; 
output; 
end; 
run; 

proc contents data=work.customerdim; 
run; 
%let start=%sysfunc(datetime()); 

*sasfile work.customerdim load;

proc freq data=work.customerdim;
   tables CustomerCountry CustomerType;
run;

/*proc print data=work.customerdim noobs;*/
/*    where CustomerType='Orion Club Gold members high activity';*/
/*   var CustomerID CustomerName CustomerAgeGroup;*/
/*run;*/

proc means data=work.customerdim mean median max min;
   var CustomerAge;
   class CustomerGroup;
run;

proc tabulate data=work.customerdim format=8.;
   class CustomerAgeGroup CustomerType;
   table CustomerType All=Total,
         CustomerAgeGroup*n=' ' All=Total*n=' '/rts=45;
run;

*sasfile work.customerdim close;
%let elapsed=%sysevalf(%sysfunc(datetime())-&start);
%put &elapsed; 


%let start=%sysfunc(datetime()); 

sasfile work.customerdim load;

proc freq data=work.customerdim;
   tables CustomerCountry CustomerType;
run;

/*proc print data=work.customerdim noobs;*/
/*    where CustomerType='Orion Club Gold members high activity';*/
/*   var CustomerID CustomerName CustomerAgeGroup;*/
/*run;*/

proc means data=work.customerdim mean median max min;
   var CustomerAge;
   class CustomerGroup;
run;

proc tabulate data=work.customerdim format=8.;
   class CustomerAgeGroup CustomerType;
   table CustomerType All=Total,
         CustomerAgeGroup*n=' ' All=Total*n=' '/rts=45;
run;

sasfile work.customerdim close;
%let elapsed=%sysevalf(%sysfunc(datetime())-&start);
%put &elapsed; 

options nofullstimer;
