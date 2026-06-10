MERGE INTO [Roles] AS Target
USING
(
    VALUES
        ('Admin', 'System Administrator'),
        ('Super Admin', 'Full access to all modules and settings'),
        ('Manager', 'Manages teams and operations'),
        ('Team Lead', 'Leads and supervises team members'),
        ('Sales Executive', 'Handles sales activities and customer interactions'),
        ('Support Engineer', 'Provides application and technical support'),
        ('Marketing Executive', 'Manages marketing campaigns and promotions'),
        ('Dealer', 'Dealer portal access and management'),
        ('Customer', 'Customer portal access'),
        ('Viewer', 'Read-only access to the system')
) AS Source (RoleName, Description)
ON Target.RoleName = Source.RoleName

WHEN MATCHED THEN
    UPDATE SET
        Description = Source.Description,
        IsActive = 1,
        ModifiedBy = 'System',
        ModifiedDate = GETDATE()

WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (
        RoleName,
        Description,
        IsActive,
        CreatedBy,
        CreatedDate,
        ModifiedBy,
        ModifiedDate
    )
    VALUES
    (
        Source.RoleName,
        Source.Description,
        1,
        'System',
        GETDATE(),
        'System',
        GETDATE()
    );

-- Optional: End MERGE statement
;