# SQL-Final-Project

How to run the solution for each drill:

1.) **How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?**  
exec dbo.uspGetCopies 'The Lost Tribe', 'Sharpstown';

2.) **How many copies of the book titled "The Lost Tribe" are owned by each library branch?**

exec dbo.uspGetCopies 'The Lost Tribe';

3.) **Retrieve the names of all borrowers who do not have any books checked out.**
exec dbo.uspGetInactiveBorrowers;

4.) **For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.**
exec dbo.uspGetDueBooks 'date', 'Sharpstown';   -- where 'date' is today in 'yyyy-mm-dd' format.

5.) **For each library branch, retrieve the branch name and the total number of books loaned out from that branch.**
exec dbo.uspGetTotalLoans;

6.) **Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.**
exec dbo.uspGetFrequentBorrowers;

7.) **For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".**
exec dbo.uspGetCopiesByAuthor 'Stephen King', 'Central';
