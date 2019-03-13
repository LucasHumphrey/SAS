/**********************************************************
 Written by: Lucas Humphrey
 Date: December 2, 2018
 
 This program reads the clinical data and uses the SQL
 procedure to organize the data into a table while
 calculating the average weights per group and calculating
 the differences between each patient's weight and their
 group's average.
 **********************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC SQL;
    title 'Within Treatment Group Differences on The First Visit';
    select patient,
	       gender,
		   v_date label='First_visit',
		   avg(weight) as mean label='Group_Average',
		   weight - calculated mean as diff label='Within_Group_Diff'
	from stat483.clinical
	where visit = 1
	group by group
	order by v_date;
QUIT;
