use LibraryInventoryDatabase;
go

-- Search by Author and Branch Name, retrieve the Title and copies owned for each book by the branch.

create procedure dbo.uspGetCopiesByAuthor @Author varchar(30), @BranchName varchar(50) = null
as
    select Books.Title, BookCopies.NumberOfCopies, LibraryBranch.BranchName
    from LibraryBranch
        inner join BookCopies on LibraryBranch.BranchID = BookCopies.BranchID
        inner join Books on BookCopies.BookID = Books.BookID
        inner join BookAuthors on Books.BookID = BookAuthors.BookID
    where BookAuthors.AuthorName like '%' + @Author + '%' and
        LibraryBranch.BranchName like isnull(@BranchName, BranchName) + '%';
go

exec dbo.uspGetCopiesByAuthor 'Stephen King', 'Central';