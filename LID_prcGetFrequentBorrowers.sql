use LibraryInventoryDatabase;
go

-- Gather info about heavy library users.

create procedure dbo.uspGetFrequentBorrowers
as
    declare @borrowerLoanOuts table (CardNo int, Loans int);

    insert into @borrowerLoanOuts (CardNo, Loans)
    select bl.CardNo, count(bl.CardNo) as Loans
    from BookLoans as bl
        inner join Borrower on bl.CardNo = Borrower.CardNo
    group by bl.CardNo;

    select b.Name, b.Address, loans.Loans as 'Total Loans'
    from Borrower as b
        inner join @borrowerLoanOuts as loans on b.CardNo = loans.CardNo
    where loans.Loans >= 5;
go

exec dbo.uspGetFrequentBorrowers;