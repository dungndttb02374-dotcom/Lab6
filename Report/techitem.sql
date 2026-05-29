
CREATE DATABASE TechItemDB3
GO

USE TechItemDB3
GO



CREATE TABLE Category
(
    CategoryId INT PRIMARY KEY IDENTITY,

    CategoryName NVARCHAR(100),

    Description NVARCHAR(500)
)


CREATE TABLE Supplier
(
    SupplierId INT PRIMARY KEY IDENTITY,

    SupplierName NVARCHAR(200),

    Phone VARCHAR(20),

    Email VARCHAR(100),

    Address NVARCHAR(300)
)


CREATE TABLE Users
(
    UserId INT PRIMARY KEY IDENTITY,

    FullName NVARCHAR(200),

    Email VARCHAR(100),

    Password NVARCHAR(200),

    Phone VARCHAR(20),

    Address NVARCHAR(300),

    Role NVARCHAR(50)
)



CREATE TABLE Products
(
    ProductId INT PRIMARY KEY IDENTITY,

    ProductName NVARCHAR(200),

    Description NVARCHAR(MAX),

    Price DECIMAL(18,2),

    Quantity INT,

    ImageUrl NVARCHAR(500),

    CategoryId INT,

    SupplierId INT,

    FOREIGN KEY (CategoryId)
        REFERENCES Category(CategoryId),

    FOREIGN KEY (SupplierId)
        REFERENCES Supplier(SupplierId)
)

/* =========================
   ORDERS
========================= */

CREATE TABLE Orders
(
    OrderId INT PRIMARY KEY IDENTITY,

    UserId INT,

    OrderDate DATETIME,

    TotalMoney DECIMAL(18,2),

    Status NVARCHAR(100),

    FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
)



CREATE TABLE OrderDetail
(
    OrderDetailId INT PRIMARY KEY IDENTITY,

    OrderId INT,

    ProductId INT,

    Quantity INT,

    Price DECIMAL(18,2),

    FOREIGN KEY (OrderId)
        REFERENCES Orders(OrderId),

    FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
)



CREATE TABLE Warehouse
(
    WarehouseId INT PRIMARY KEY IDENTITY,

    ProductId INT,

    ImportQuantity INT,

    ExportQuantity INT,

    LastUpdate DATETIME,

    FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
)



INSERT INTO Category
(
    CategoryName,
    Description
)
VALUES
(N'Điện thoại', N'Smartphone'),

(N'Laptop', N'Laptop gaming'),

(N'Tai nghe', N'Gaming gear'),

(N'PC Gaming', N'Máy tính gaming'),

(N'Phụ kiện', N'Phụ kiện công nghệ')



INSERT INTO Supplier
(
    SupplierName,
    Phone,
    Email,
    Address
)
VALUES
(N'Apple Việt Nam','0909999999','apple@gmail.com',N'Hồ Chí Minh'),

(N'ASUS Việt Nam','0911111111','asus@gmail.com',N'Hà Nội'),

(N'Logitech Việt Nam','0922222222','logitech@gmail.com',N'Đà Nẵng')



INSERT INTO Users
(
    FullName,
    Email,
    Password,
    Phone,
    Address,
    Role
)
VALUES(N'Admin','dung@gmail.com','123456','0901234567',N'Hồ Chí Minh','dung'
),

(N'Nguyễn Văn A','user@gmail.com','123456','0912345678',N'Hà Nội','Customer')



INSERT INTO Products
(
    ProductName,
    Description,
    Price,
    Quantity,
    ImageUrl,
    CategoryId,
    SupplierId
)
VALUES
(N'iPhone 15 Pro Max',N'Điện thoại Apple cao cấp',28990000,50,
'https://images.unsplash.com/photo-1695048133142-1a20484d2569',1,1),

(N'ASUS ROG Zephyrus',N'Laptop Gaming hiệu năng cao',32990000,20,
'https://images.unsplash.com/photo-1593642702821-c8da6771f0c6',2,2),

(N'Logitech G Pro X',N'Tai nghe gaming chuyên nghiệp',3290000,35,
'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',3,3),

(N'Samsung Odyssey G5',N'Màn hình gaming 2K',5490000,15,
'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf',4,2),

(N'Apple Watch Series 9',N'Đồng hồ thông minh Apple',8490000,25,
'https://images.unsplash.com/photo-1546868871-7041f2a55e12',5,1)



INSERT INTO Orders
(
    
    UserId,
    OrderDate,
    TotalMoney,
    Status
)
VALUES(2,GETDATE(),32280000,N'Đang giao')


INSERT INTO OrderDetail(OrderId,ProductId,Quantity,Price
)
VALUES(1,1,1,28990000),

(1,3,1,3290000)


INSERT INTO Warehouse
(
    ProductId,
    ImportQuantity,
    ExportQuantity,
    LastUpdate
)
VALUES(1,100,50,GETDATE()),

(2,50,20,GETDATE()),

(3,70,35,GETDATE())