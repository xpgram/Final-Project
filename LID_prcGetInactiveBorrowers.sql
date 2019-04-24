use LibraryInventoryDatabase;
go

-- Retrieve the names of all borrowers who have no books checked out.

create procedure dbo.uspGetInactiveBorrowers
as
    declare @activeBorrowers table (Name varchar(30));
    
    insert into @activeBorrowers (Name)
    select Borrower.Name as Name
    from BookLoans
        inner join Borrower on BookLoans.CardNo = Borrower.CardNo;

    select Name from Borrower
    except
    select Name from @activeBorrowers;
go

exec dbo.uspGetInactiveBorrowers;