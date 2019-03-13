/**************************************
 Written by: Lucas Humphrey
 Date: September 16, 2018
 
 This program corrects the errors from
 Hannah Highbaum's code.
 **************************************/
OPTIONS PS = 58 LS = 64 NODATE NONUMBER CENTER;

DATA sales;
    INPUT Date $ Store $ Mon Tues Wed Thurs Fri;
    AvgSales = (Mon + Tues + Wed + Thurs + Fri)/5; 	
    length Group $7;
    if AvgSales = '.' then Group = 'N/A'; 
       else if (AvgSales LT 605) then Group = 'Low';
       else if (605 LE AvgSales LE 750) then Group = 'Average'; 
       else if (AvgSales GT 750) then Group = 'High'; 
    if Store = 110 then region = 'South'; 
       else if Store = 111 then region = 'South';
       else if Store = 112 then region = 'North';
       else if Store = 113 then region = 'North';
       else if Store = 114 then region = 'North';
    drop Mon Tues Wed Thurs Fri;
    DATALINES;
10/12/07 110 412 532 641 701 802
10/12/07 111 478 567 699 789 821
10/12/07 112 399 501 650 712 812
10/12/07 113 421 532 698 756 872
10/12/07 114 401 510 612 721 899
17/12/07 110 710 725 789 721 799
17/12/07 111 689 701 729 703 721
17/12/07 112 899 812 802 738 712
17/12/07 113 700 712 748 765 801
17/12/07 114 699 799 899 608   .
24/12/07 110 340 333 321 401 490
24/12/07 111 801 793 721 763 798
24/12/07 112 598 798 684 502 412
24/12/07 113 980 921 832 812 849
24/12/07 114 798 709 721 799 724
31/12/07 110 487 321 399 312 321
31/12/07 111 501 532 598 581 601
31/12/07 112 598 512 540 523 549
31/12/07 113 601 625 674 698 601
31/12/07 114 900 805 700 601 811
     ;
RUN;

PROC PRINT data = sales;
     var Date Store AvgSales Group region;
     title 'Sales Data';
RUN;
