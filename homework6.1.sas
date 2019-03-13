/*******************************************************
 Written by: Lucas Humphrey
 Date: September 9, 2018
 
 This program reads in and formats a dataset containing
 information regarding popular books for children, then
 sorts and prints the five books whose prices per page
 are greater than 30 cents in descending order of price.
 *******************************************************/
OPTIONS PS=38 LS=64 NODATE NONUMBER;

DATA kidsbooks;
  infile 'C:\Users\Amy\Desktop\stat483\data\kidsbooks.txt';
  input title $ 1-20 author $ 22-40 publisher $ 43-58 
        pubdate $ 61-70 price 72-76 pages 79-80;
  ppp = price/pages;
RUN;

PROC SORT data=kidsbooks out=srtd_kidsbooks;
  by descending price;
RUN;

PROC PRINT data=srtd_kidsbooks LABEL DOUBLE;
  title 'Popular Books for Children';
  label title = 'Title'
        author = 'Author'
		price = 'Price'
		pages = 'No. of Pages'
		ppp = 'Price Per Page'
		publisher = 'Publisher'
		pubdate = 'Publication Date';
  format price dollar6.2;
  format ppp dollar5.2;
  id title;
  var author price pages ppp publisher pubdate;
  where ppp > 0.30;
  sum price;
  footnote 'Price obtained from Amazon.com';
RUN;
