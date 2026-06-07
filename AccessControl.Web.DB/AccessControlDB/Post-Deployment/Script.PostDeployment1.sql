/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO [User] AS Target

USING (

    VALUES

    (

        'Admin',

        'admin@portal.com',

        '1111111111',

        'Admin@2026',

        'Admin',

        0,

        1

    )

) AS Source

(

    Name,

    Email,

    Phone,

    [Password],

    [Role],

    IsBlocked,

    IsActive

)

ON Target.Email = Source.Email
 
WHEN NOT MATCHED THEN

    INSERT

    (

        Name,

        Email,

        Phone,

        [Password],

        [Role],

        IsBlocked,

        IsActive

    )

    VALUES

    (

        Source.Name,

        Source.Email,

        Source.Phone,

        Source.[Password],

        Source.[Role],

        Source.IsBlocked,

        Source.IsActive

    );
 
