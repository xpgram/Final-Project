use LibraryInventoryDatabase;
go

-- Compile all the loan-outs from every branch. Gonna needa count().

create procedure dbo.uspGetTotalLoans
as
    select BranchName, count(BranchName) as 'Total Loans'
    from BookLoans
        inner join LibraryBranch on BookLoans.BranchID = LibraryBranch.BranchID
    group by BranchName;
go

exec dbo.uspGetTotalLoans;