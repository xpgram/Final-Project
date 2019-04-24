use LibraryInventoryDatabase;
go

-- From all branches, or some, retrieve the names, address' and book titles
-- for all lent books which are due today.

create procedure dbo.uspGetDueBooks @DueDate date, @BranchName varchar(50) = null
as
    select Books.Title, Borrower.Name, Borrower.Address
    from BookLoans
        inner join Books on BookLoans.BookID = Books.BookID
        inner join Borrower on BookLoans.CardNo = Borrower.CardNo
        inner join LibraryBranch on BookLoans.BranchID = LibraryBranch.BranchID
    where LibraryBranch.BranchName like isnull(@BranchName, BranchName) + '%' and
        BookLoans.DateDue = @DueDate;
go

exec dbo.uspGetDueBooks '2019-08-28', 'Sharp';