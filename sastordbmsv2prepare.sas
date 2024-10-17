proc options group=performance; run; 
options sastrace=',,t,d' sastraceloc=saslog nostsuffix; 
options msglevel=i; 
libname bi oracle user=student password="Metadata0" path=XE 
readbuff=10000 insertbuff=10000 dbsliceparm=(threaded_apps,4) ;
libname sas cvp 'd:\Workshop\pg3\orstar';

libname library "d:\workshop\orionstar\orfmt"; 
options nofmterr; 
/*
proc datasets lib=work kill; 
quit; 
proc copy inlib=sas outlib=work; 
select order_fact customer_dim product_dim; 
run; 
proc datasets lib=work; 
change order_fact=ora_order_fact; 
change customer_dim=ora_customer_dim; 
change product_dim=ora_product_dim; 
quit; 
proc sql; 
drop table bi.ora_order_fact; 
drop table bi.ora_customer_dim; 
drop table bi.ora_product_dim; 
quit; 
proc copy inlib=work outlib=bi; 
select ora_order_fact ora_customer_dim ora_product_dim; 
run; 

proc sql; 
drop table ora_order_fact; 
drop table ora_customer_dim; 
drop table ora_product_dim; 
quit; 
*/