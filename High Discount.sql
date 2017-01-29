USE "pubs";

UPDATE discounts SET stor_id = 7896
WHERE discounttype = 'Initial Customer';
GO

USE "pubs";
DECLARE @highDiscount decimal(4,2);
SELECT @highDiscount = MAX(discount)
FROM discounts;

DECLARE @storeName nvarchar(40);
SELECT @storeName = stores.stor_name
FROM stores
JOIN discounts on stores.stor_id = discounts.stor_id
WHERE discounts.discount=@highDiscount;

DECLARE @discountAmount decimal(4,2);
SET @discountAmount = @highDiscount * .10;

DECLARE @totalNewDiscount decimal(4,2);
SET @totalNewDiscount = @discountAmount + @highDiscount;

PRINT 'High Discount: ' + CAST(@highDiscount AS VARCHAR(7));
PRINT 'Store Name: ' + @storeName;
PRINT 'Discount Amount: ' + CAST(@discountAmount AS VARCHAR(7));
PRINT 'New total discount: ' + CAST(@totalNewDiscount AS VARCHAR(7));
GO
