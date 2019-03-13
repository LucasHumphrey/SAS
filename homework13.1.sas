/******************************************************
 Written by: Lucas Humphrey
 Date: September 25, 2018
 
 This program sorts the tours data by vendor, then
 creates an accumulated variable for total bookings
 before finally printing the total bookings by vendor.
 ******************************************************/
OPTIONS NODATE NONUMBER;
LIBNAME stat483 'C:\Users\Amy\Desktop\stat483\data';

PROC SORT data=stat483.tours out=srtdtours;
  by vendor;
RUN;

DATA total;
  set srtdtours;
  by vendor;
  if first.vendor then booktotal = 0;
  booktotal + bookings;
  if last.vendor;
  drop country landcost;
RUN;

PROC PRINT data=total LABEL;
  title 'Total Bookings by Vendor';
  label vendor = 'Vendor'
        booktotal = 'Total Bookings';
  id vendor;
  var booktotal;
RUN;
