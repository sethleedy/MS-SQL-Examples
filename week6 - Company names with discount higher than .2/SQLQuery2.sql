USE "pubs";

SELECT titles.title_id, titles.title AS [Book Title]
FROM titles 
WHERE NOT EXISTS (SELECT *
 FROM sales
 WHERE titles.title_id = sales.title_id
 );