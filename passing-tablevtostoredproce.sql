--/* Create a table type. */
--CREATE TYPE LocationTableType1 
--   AS TABLE
--      ( LocationName VARCHAR(50)
--      , CostRate INT );
--GO
--/* Create a procedure to receive data for the table-valued parameter. */
--CREATE PROCEDURE dbo. usp_InsertProductionLocation1
--   @TVP LocationTableType READONLY
--      AS
--      SET NOCOUNT ON
--      INSERT INTO Production.Location
--         (
--            Name
--            , CostRate
--            , Availability
--            , ModifiedDate
--         )
--      SELECT *, 0, GETDATE()
--      FROM @TVP;


	  /* Declare a variable that references the type. */
DECLARE @LocationTVP AS LocationTableType1;
/* Add data to the table variable. */
INSERT INTO @LocationTVP (LocationName, CostRate)
   SELECT Name, 0.00
   FROM Person.StateProvince;
  
/* Pass the table variable data to a stored procedure. */
EXEC usp_InsertProductionLocation1 @LocationTVP;