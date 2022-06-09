# steps to run the test's


1) open a terminal
2) cd your_path (choose the folder where you want to download the repository)
3) git clone git@github.com:joelGarcia93/league.git
4) you also can download the repository manually by hit click on "code" button options and then hit click on download zip button
5) cd league (go to the downloaded project in your terminal)
6) run *bundle install* 
7) run *rspec*

at this point you should see these points

1) original matrix string
2) invert matrix string
3) all the unit test's passing (green color) I love it :)


I'm providing an example in my local PC when I run the test's

MacBook-Air-de-Joel:league joelgarcia$ rspec
1,2,3
4,5,6
7,8,9
1,4,7
2,5,8
3,6,9
......


# options to fire exceptions and get error messages

1) modifing csv file and set 0, negative value or not number
2) modifing csv file with different number of columns in some row than others
3) modifing csv file with not equal number of rows and columns
