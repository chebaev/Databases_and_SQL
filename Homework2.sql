
-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

DROP DATABASE IF EXISTS seminar2;
CREATE DATABASE IF NOT EXISTS seminar2;
USE seminar2;

DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(id INT PRIMARY KEY AUTO_INCREMENT,
orders_date DATE NOT NULL,
count_product INT
);

INSERT INTO sales (orders_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT * FROM sales;
/*меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/
-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300 (функция IF).

SELECT
id AS 'id заказа',
IF (count_product < 100, "Маленький заказ",
	IF ( count_product < 300, "Средний заказ",  "Большой заказ"))
AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount DECIMAL(10,2) NOT NULL,
order_status VARCHAR(9) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.00, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");

SELECT * FROM orders;

SELECT id, employee_id, amount, order_status,
CASE
	WHEN order_status = "OPEN"
		THEN 'Order is in open state'
	WHEN order_status = "CLOSED"
		THEN 'Order is closed'
	ELSE 'Order is cancelled'
END AS full_order_status
FROM orders;

-- 4. Чем NULL отличается от 0?
/*
 Когда в столбце не содержится никакого значения, это значит,
 что в нем содержится значение NULL. Значение NULL подразумевает
 отсутствие какого-либо значения, в отличие от поля, содержащего или 0,
 или пустую строку, или просто несколько пробелов.
 */
