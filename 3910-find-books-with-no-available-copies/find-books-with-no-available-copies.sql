# Write your MySQL query statement below
WITH borrowed AS(
    SELECT book_id, COUNT(book_id) AS current_borrowers, return_date
    FROM borrowing_records
    WHERE return_date IS NULL
    GROUP BY book_id
)
SELECT l.book_id, l.title, l.author, l.genre, l.publication_year, current_borrowers
FROM library_books l
RIGHT JOIN borrowed b
ON l.book_id = b.book_id
WHERE (total_copies - current_borrowers) = 0
ORDER BY current_borrowers DESC, l.title ASC