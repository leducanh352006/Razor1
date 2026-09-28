-- KỊCH BẢN TẠO CƠ SỞ DỮ LIỆU VÀ BẢNG SẢN PHẨM TRÊN SQL SERVER

-- 1. Tạo Database Razor1Db (nếu chưa có)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Razor1Db')
BEGIN
    CREATE DATABASE Razor1Db;
END
GO

USE Razor1Db;
GO

-- 2. Tạo bảng Products
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[Products] (
        [Id] INT IDENTITY(1,1) NOT NULL,
        [Name] NVARCHAR(200) NOT NULL,
        [Price] DECIMAL(18,2) NOT NULL,
        CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([Id] ASC)
    );
END
GO

-- 3. Thêm dữ liệu mẫu vào bảng Products
IF NOT EXISTS (SELECT 1 FROM [dbo].[Products])
BEGIN
    INSERT INTO [dbo].[Products] ([Name], [Price]) VALUES
    (N'Laptop Dell XPS 15', 35000000.00),
    (N'iPhone 15 Pro Max', 30000000.00),
    (N'Bàn phím cơ Keychron K2', 2200000.00),
    (N'Chuột không dây Logitech MX Master 3S', 2500000.00),
    (N'Tai nghe chống ồn Sony WH-1000XM5', 8490000.00),
    (N'Màn hình LG UltraGear 27 inch 4K', 12500000.00);
END
GO
