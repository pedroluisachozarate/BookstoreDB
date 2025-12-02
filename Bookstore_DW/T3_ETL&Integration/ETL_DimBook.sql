INSERT INTO DimBook (BookID, Title, Author, Language, Publisher)
SELECT
    b.book_id,
    b.title,
    a.author_name,
    bl.language_name,
    p.publisher_name
FROM Bookstore.dbo.book b
LEFT JOIN Bookstore.dbo.book_author ba ON b.book_id = ba.book_id
LEFT JOIN Bookstore.dbo.author a ON ba.author_id = a.author_id
LEFT JOIN Bookstore.dbo.book_language bl ON b.book_id = bl.book_id
LEFT JOIN Bookstore.dbo.publisher p ON b.publisher_id = p.publisher_id;
