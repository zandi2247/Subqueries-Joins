-- Find the products that have never been ordered --

Use sql_store;

SELECT *
FROM products
WHERE product_id NOT IN
     (Select DISTINCT product_id
     FROM order_items);
     
     -- Find Clients Without invoices --
     
     USE sql_invoicing;
     
     Select *
     FROM clients
     WHERE client_id NOT IN
     (Select DISTINCT Client_id
     FROM invoices);
     
     
     -- Find customers who have ordered lettuce (id=3) --
     -- Select customer_id, first_name, last_name --
     
     USE sql_store;
     Select *
     FROM customers
     WHERE customer_id IN (
		Select o.customer_id
        From order_items oi
        join orders o USING (order_id)
        Where product_id =3
     ) ;
     -- alternative solve using joins --
     SELECT DISTINCT customer_id, first_name, last_name
     FROM customers c
     JOIN orders o USING (customer_id)
     JOIN order_items oi USING (order_id)
     WHERE oi.product_id = 3
     