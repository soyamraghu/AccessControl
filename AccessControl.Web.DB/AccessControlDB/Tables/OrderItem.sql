CREATE TABLE [OrderItem]
(
    OrderItemId     INT                 IDENTITY(1,1)   PRIMARY KEY,
    OrderId         INT                 NULL,
    ProductId       INT                 NULL,
    Quantity        INT                 NULL,
    UnitPrice       DECIMAL(18,2)       NULL,
    TotalPrice      DECIMAL(18,2)       NULL,
    IsActive        BIT                 NULL DEFAULT 1,
    CreatedBy       VARCHAR(100)        NULL,
    CreatedDate     DATETIME            NULL DEFAULT GETDATE(),
    ModifiedBy      VARCHAR(100)        NULL,
    ModifiedDate    DATETIME            NULL
);