USE bookshop;
-- 只演示、最后回滚，保证数据可重复使用。事务详细原理留到后续。
START TRANSACTION;
SELECT id, title, stock FROM books WHERE title = '三体';
UPDATE books SET stock = stock - 1 WHERE title = '三体' AND stock > 0;
SELECT id, title, stock FROM books WHERE title = '三体';
ROLLBACK;

START TRANSACTION;
INSERT INTO books (title, author_id, price, stock)
SELECT '删除演示专用临时书', id, 1.00, 1 FROM authors WHERE name = '鲁迅';
SELECT id, title FROM books WHERE title = '删除演示专用临时书';
DELETE FROM books WHERE title = '删除演示专用临时书';
SELECT id, title FROM books WHERE title = '删除演示专用临时书';
ROLLBACK;
-- 不演示无 WHERE 的破坏操作，不删除作者，避免触发外键限制。
