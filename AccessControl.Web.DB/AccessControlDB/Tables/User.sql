CREATE TABLE [dbo].[User]
  (Id Int identity(1,1) Primary Key,
   Name Varchar (50) Null,
   Email Varchar(50) Null,
   Phone Varchar(12) Null,
   Password Varchar(Max) Null,
   Role Varchar(50) null,
   IsBlocked bit Default 0, 
   IsActive bit Default 0)

