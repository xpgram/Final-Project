use LibraryInventoryDatabase
go

-- Query Number of Copies from a particular library branch, or all of them.

create procedure dbo.uspGetCopies @BookName varchar(50), @BranchName varchar(50) = null
as
    declare @result table (BranchName varchar(50), NumberOfCopies int);
    
    insert into @result (BranchName, NumberOfCopies)
    select LibraryBranch.BranchName, NumberOfCopies
    from BookCopies
        inner join LibraryBranch on BookCopies.BranchID = LibraryBranch.BranchID
        inner join Books on BookCopies.BookID = Books.BookID
    where
        Books.Title like @BookName + '%' and
        LibraryBranch.BranchName like isnull(@BranchName, LibraryBranch.BranchName) + '%'
    order by LibraryBranch.BranchName;

    select * from @result;
    select sum(NumberOfCopies) as 'Total Copies' from @result;
go

execute dbo.uspGetCopies 'The Lost Tribe', 'Sharp';