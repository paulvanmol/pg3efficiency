data staff; 
 set orion.staff; 
do i=1 to 10000;
output; 
end; 
run; 
proc contents data=work.staff; 
run; 

/* Program 1 */
data bigsalaries;
   set work.staff;
   where Salary > 50000;
run;

proc means data=bigsalaries mean sum;
   class ManagerID;
   var Salary;
run;

 /* Program 2 */
proc means data=work.staff mean sum;
   class ManagerID;
   var Salary;
   where Salary > 50000;
run;
