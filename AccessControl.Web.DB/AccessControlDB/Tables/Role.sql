CREATE TABLE [Role]
(
    RoleId          INT                 IDENTITY(1,1)   PRIMARY KEY,
    RoleName        VARCHAR(100)        NULL,
    Description     VARCHAR(255)        NULL,
    IsActive        BIT                 NULL DEFAULT 1,
    CreatedBy       VARCHAR(100)        NULL,
    CreatedDate     DATETIME            NULL DEFAULT GETDATE(),
    ModifiedBy      VARCHAR(100)        NULL,
    ModifiedDate    DATETIME            NULL
);
