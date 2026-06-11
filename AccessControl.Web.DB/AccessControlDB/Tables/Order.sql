CREATE TABLE [Order]
(
    OrderId         INT                 IDENTITY(1,1)   PRIMARY KEY,
    OrderNumber     VARCHAR(50)         NULL,
    CustomerName    VARCHAR(200)        NULL,
    CustomerEmail   VARCHAR(200)        NULL,
    CustomerPhone   VARCHAR(20)         NULL,
    TotalAmount     DECIMAL(18,2)       NULL,
    OrderDate       DATETIME            NULL DEFAULT GETDATE(),
    Status          VARCHAR(50)         NULL,
    IsActive        BIT                 NULL DEFAULT 1,
    CreatedBy       VARCHAR(100)        NULL,
    CreatedDate     DATETIME            NULL DEFAULT GETDATE(),
    ModifiedBy      VARCHAR(100)        NULL,
    ModifiedDate    DATETIME            NULL
);