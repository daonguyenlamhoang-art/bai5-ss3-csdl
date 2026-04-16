/*Trường hợp số lượng âm: Chúng ta sử dụng ràng buộc CHECK Constraint ngay khi tạo bảng. 
 Nếu sản phẩm đã có, ta chỉ việc Cộng dồn (UPDATE) số lượng cũ với số lượng mới.
 
 */


create database cart; 
use cart ; 
CREATE TABLE CART_ITEMS (
CartItemID INT PRIMARY KEY , 
UserID INT, -- ID của người mua hàng
ProductID INT, -- ID sản phẩm
Quantity INT check(Quantity>0)  , 
ProductName varchar(50) not null ,
addedDate DATETIME 
); 

insert into CART_ITEMS 
valueS(3,1,1,11,'Sữa vinamilk','2026-04-16 10:30:00'),
	(2,5,1,11,'Sữa HEHE','2026-05-16 10:30:00'),
    (1,2,1,10,'Sữa vinamilk','2026-04-16 10:30:00')
; 
INSERT INTO CART_ITEMS (CartItemID, UserID, ProductID, Quantity, ProductName, addedDate)
SELECT 6,1,1,110,'Sữa vinamilk','2026-04-16 10:30:00'
WHERE -10 > 0;

SELECT * FROM CART_ITEMS ; 
SET SQL_SAFE_UPDATES = 0;

UPDATE CART_ITEMS 
SET Quantity = 5
WHERE CartItemID IS NOT NULL; 

DELETE FROM CART_ITEMS 
WHERE CartItemID = 1;

