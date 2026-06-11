MERGE INTO [User] AS Target
USING
(
    VALUES

    ('Admin','admin@portal.com','1111111111','Admin@2026','Admin',0,1),

    ('John Smith','john.smith@portal.com','9000000001','Customer@2026','Customer',0,1),
    ('Emma Johnson','emma.johnson@portal.com','9000000002','Customer@2026','Customer',0,1),
    ('Michael Brown','michael.brown@portal.com','9000000003','Customer@2026','Customer',0,1),
    ('Olivia Davis','olivia.davis@portal.com','9000000004','Customer@2026','Customer',0,1),
    ('William Wilson','william.wilson@portal.com','9000000005','Customer@2026','Customer',0,1),
    ('Sophia Moore','sophia.moore@portal.com','9000000006','Customer@2026','Customer',0,1),
    ('James Taylor','james.taylor@portal.com','9000000007','Customer@2026','Customer',0,1),
    ('Isabella Anderson','isabella.anderson@portal.com','9000000008','Customer@2026','Customer',0,1),
    ('Benjamin Thomas','benjamin.thomas@portal.com','9000000009','Customer@2026','Customer',0,1),
    ('Mia Jackson','mia.jackson@portal.com','9000000010','Customer@2026','Customer',0,1),

    ('Lucas White','lucas.white@portal.com','9000000011','Customer@2026','Customer',0,1),
    ('Charlotte Harris','charlotte.harris@portal.com','9000000012','Customer@2026','Customer',0,1),
    ('Henry Martin','henry.martin@portal.com','9000000013','Customer@2026','Customer',0,1),
    ('Amelia Thompson','amelia.thompson@portal.com','9000000014','Customer@2026','Customer',0,1),
    ('Alexander Garcia','alexander.garcia@portal.com','9000000015','Customer@2026','Customer',0,1),
    ('Evelyn Martinez','evelyn.martinez@portal.com','9000000016','Customer@2026','Customer',0,1),
    ('Daniel Robinson','daniel.robinson@portal.com','9000000017','Customer@2026','Customer',0,1),
    ('Harper Clark','harper.clark@portal.com','9000000018','Customer@2026','Customer',0,1),
    ('Matthew Rodriguez','matthew.rodriguez@portal.com','9000000019','Customer@2026','Customer',0,1),
    ('Abigail Lewis','abigail.lewis@portal.com','9000000020','Customer@2026','Customer',0,1)

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