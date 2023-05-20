/* 
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
   Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
*/

CREATE DATABASE phone_price;

USE phone_price;

CREATE TABLE Nomenclature
( id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ProductName VARCHAR(30) NOT NULL,
Manufacturer VARCHAR(30) NOT NULL,
ProductCount INT NOT NULL,
Price FLOAT NOT NULL
);

SELECT * FROM Nomenclature;

INSERT Nomenclature( ProductName, Manufacturer, ProductCount, Price)
VALUES
("iPhone X", "Apple", 3, 76000),
("iPhone 8", "Apple", 2, 51000),
("Galaxv S9", "Samsung", 2, 56000),
("Galaxv S8", "Samsung", 1, 41000),
("P20 Pro", "Huawei", 5, 36000);

/* 
2. 	Выведите название, производителя и цену для товаров,
	количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
 */


SELECT Manufacturer, Price  FROM Nomenclature 
WHERE ProductCount > 2;

# 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT *  FROM Nomenclature 
WHERE Manufacturer LIKE "Samsung";

#4.*** С помощью регулярных выражений найти:
	#4.1. Товары, в которых есть упоминание "Iphone"
    
SELECT *  FROM Nomenclature 
WHERE ProductName LIKE "iPhone%";
    
	#4.2. "Samsung"
	
SELECT *  FROM Nomenclature 
WHERE Manufacturer LIKE "Samsung";

	#4.3.  Товары, в которых есть ЦИФРА "8"  
	
SELECT *  FROM Nomenclature 
WHERE ProductName LIKE '%8%';
