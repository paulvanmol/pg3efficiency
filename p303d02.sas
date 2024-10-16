data staff; 
 set orion.staff; 
do i=1 to 10000;
output; 
end; 
run; 
proc contents data=work.staff; 
run; 
options fullstimer; 
/* Program #1 */
data bonus;
   set work.staff;
   YrEndBonus=Salary*0.05;
run;

proc means data=bonus mean sum;
   where JobTitle contains 'Manager';
   class ManagerID;
   var YrEndBonus;
run;
proc contents data=bonus; 
run; 
 /* Program #2 */
data bonus(keep=ManagerID YrEndBonus );
   set work.staff(keep=JobTitle Salary ManagerID);
   where JobTitle contains 'Manager';
   YrEndBonus=Salary*0.05;
run;

proc means data=bonus mean sum;
   class ManagerID;
   var YrEndBonus;
   *where JobTitle contains 'Manager';
run;

proc contents data=bonus; 
run; 
