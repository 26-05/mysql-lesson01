USE bookshop;
SELECT VERSION();
SHOW TABLES;
DESC books;
SELECT id, title, price, stock FROM books ORDER BY id;
SELECT title, stock FROM books WHERE stock = 0 ORDER BY id;
SELECT title, price FROM books WHERE price BETWEEN 20 AND 40 ORDER BY price, id;
SELECT title, price FROM books ORDER BY price DESC, id ASC LIMIT 3;
SELECT b.title, a.name AS author, b.price
FROM books AS b JOIN authors AS a ON b.author_id = a.id
ORDER BY b.id;
SELECT title, price FROM books WHERE stock > 0 ORDER BY price, id LIMIT 3;
