CREATE TABLE [Category]
(
    CategoryId      INT                 IDENTITY(1,1)   PRIMARY KEY,
    CategoryName    VARCHAR(200)        NULL,
    Description     VARCHAR(500)        NULL,
    IsActive        BIT                 NULL DEFAULT 1,
    CreatedBy       VARCHAR(100)        NULL,
    CreatedDate     DATETIME            NULL DEFAULT GETDATE(),
    ModifiedBy      VARCHAR(100)        NULL,
    ModifiedDate    DATETIME            NULL
);