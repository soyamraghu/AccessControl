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
MERGE Category AS Target
USING
(
    VALUES
        ('Electronics', 'Electronic products'),
        ('Computers', 'Desktop and Laptop products'),
        ('Mobiles', 'Mobile phones and accessories'),
        ('Tablets', 'Tablet devices and accessories'),
        ('Smart Watches', 'Wearable smart devices'),
        ('Cameras', 'Digital cameras and accessories'),
        ('Audio', 'Speakers and sound systems'),
        ('Headphones', 'Headphones and earphones'),
        ('Gaming', 'Gaming consoles and accessories'),
        ('Televisions', 'TVs and entertainment systems'),

        ('Home Appliances', 'Home and kitchen appliances'),
        ('Kitchen Appliances', 'Kitchen equipment and appliances'),
        ('Refrigerators', 'Cooling appliances'),
        ('Washing Machines', 'Laundry appliances'),
        ('Air Conditioners', 'Cooling systems'),
        ('Water Purifiers', 'Water purification systems'),
        ('Vacuum Cleaners', 'Cleaning equipment'),
        ('Fans', 'Ceiling and table fans'),
        ('Geysers', 'Water heaters'),
        ('Microwaves', 'Microwave ovens'),

        ('Furniture', 'Home and office furniture'),
        ('Office Furniture', 'Furniture for offices'),
        ('Bedroom Furniture', 'Bedroom furnishings'),
        ('Living Room Furniture', 'Living room furnishings'),
        ('Dining Furniture', 'Dining room furnishings'),
        ('Outdoor Furniture', 'Garden and outdoor furniture'),
        ('Home Decor', 'Decorative items'),
        ('Lighting', 'Indoor and outdoor lighting'),
        ('Mattresses', 'Beds and mattresses'),
        ('Storage Solutions', 'Storage furniture'),

        ('Books', 'Books and publications'),
        ('Stationery', 'Office and school supplies'),
        ('Educational Supplies', 'Learning materials'),
        ('Art Supplies', 'Drawing and painting materials'),
        ('Musical Instruments', 'Music instruments'),
        ('Toys', 'Children toys'),
        ('Board Games', 'Indoor games'),
        ('Puzzles', 'Puzzle products'),
        ('Collectibles', 'Collectible items'),
        ('Craft Supplies', 'Crafting materials'),

        ('Fashion', 'Fashion products'),
        ('Men Clothing', 'Clothing for men'),
        ('Women Clothing', 'Clothing for women'),
        ('Kids Clothing', 'Clothing for kids'),
        ('Footwear', 'Shoes and sandals'),
        ('Bags', 'Handbags and backpacks'),
        ('Watches', 'Traditional watches'),
        ('Jewelry', 'Jewelry products'),
        ('Sunglasses', 'Eyewear products'),
        ('Accessories', 'Fashion accessories'),

        ('Beauty', 'Beauty products'),
        ('Skincare', 'Skin care products'),
        ('Haircare', 'Hair care products'),
        ('Makeup', 'Cosmetic products'),
        ('Personal Care', 'Personal hygiene products'),
        ('Perfumes', 'Fragrances and perfumes'),
        ('Health Care', 'Health-related products'),
        ('Fitness Equipment', 'Exercise equipment'),
        ('Supplements', 'Nutritional supplements'),
        ('Yoga Accessories', 'Yoga products'),

        ('Sports', 'Sports equipment'),
        ('Cricket', 'Cricket equipment'),
        ('Football', 'Football equipment'),
        ('Badminton', 'Badminton equipment'),
        ('Cycling', 'Cycles and accessories'),
        ('Camping', 'Camping gear'),
        ('Hiking', 'Hiking equipment'),
        ('Swimming', 'Swimming accessories'),
        ('Gym Equipment', 'Gym products'),
        ('Outdoor Sports', 'Outdoor sporting goods'),

        ('Automotive', 'Automotive products'),
        ('Car Accessories', 'Car accessories'),
        ('Bike Accessories', 'Motorcycle accessories'),
        ('Tyres', 'Vehicle tyres'),
        ('Lubricants', 'Engine oils and lubricants'),
        ('Spare Parts', 'Vehicle spare parts'),
        ('Tools', 'Repair and maintenance tools'),
        ('GPS Devices', 'Navigation devices'),
        ('Car Electronics', 'Automotive electronics'),
        ('Vehicle Care', 'Vehicle cleaning products'),

        ('Pet Supplies', 'Pet products'),
        ('Dog Supplies', 'Products for dogs'),
        ('Cat Supplies', 'Products for cats'),
        ('Bird Supplies', 'Products for birds'),
        ('Aquarium', 'Fish tanks and accessories'),
        ('Gardening', 'Gardening supplies'),
        ('Plants', 'Indoor and outdoor plants'),
        ('Seeds', 'Seeds and fertilizers'),
        ('Agriculture', 'Agricultural products'),
        ('Industrial Supplies', 'Industrial equipment'),

        ('Construction', 'Construction materials'),
        ('Safety Equipment', 'Safety and protection products'),
        ('Medical Equipment', 'Medical devices'),
        ('Laboratory Supplies', 'Lab equipment'),
        ('Packaging', 'Packaging materials'),
        ('Office Supplies', 'Office essentials'),
        ('Software', 'Software products'),
        ('Networking', 'Networking equipment'),
        ('Cloud Services', 'Cloud-related products'),
        ('Digital Products', 'Digital goods'),

        ('Gift Items', 'Gift products'),
        ('Party Supplies', 'Party decorations'),
        ('Travel Accessories', 'Travel products'),
        ('Luggage', 'Suitcases and travel bags'),
        ('Baby Products', 'Baby care products'),
        ('Maternity Products', 'Maternity care items'),
        ('Organic Products', 'Organic goods'),
        ('Eco Friendly Products', 'Sustainable products'),
        ('Handmade Products', 'Handcrafted goods'),
        ('Miscellaneous', 'Other products')
) AS Source (CategoryName, Description)
ON Target.CategoryName = Source.CategoryName

WHEN NOT MATCHED THEN
INSERT
(
    CategoryName,
    Description,
    IsActive,
    CreatedBy,
    CreatedDate
)
VALUES
(
    Source.CategoryName,
    Source.Description,
    1,
    'System',
    GETDATE()
);