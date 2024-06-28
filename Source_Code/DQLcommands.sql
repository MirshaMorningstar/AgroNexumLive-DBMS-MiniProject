--DQL with where conditions

--Select all products with a specific username from the addagroproducts table:
SELECT * FROM addagroproducts WHERE username = 'nevin';

--Retrieve farming types with a specific ID from the farming table:
SELECT * FROM farming WHERE fid = 1;

--Find farmers with a specific Aadhar number from the register table:
SELECT * FROM register WHERE adharnumber = '1234567890';

--Get information about a specific test from the test table:
SELECT * FROM test WHERE id = 1;

--Retrieve triggers associated with a specific farmer ID from the trig table:
SELECT * FROM trig WHERE fid = '2';

--Select user information for a specific username from the user table:
SELECT * FROM user WHERE username = 'nevin';

--Retrieve users who are associated with agriculture (is_agrarian = TRUE) from the user table:
SELECT * FROM user WHERE is_agrarian = TRUE;

--Find users who have admin privileges (is_admin = TRUE) from the user table:
SELECT * FROM user WHERE is_admin = TRUE;


--DQL with aggregate functions

--Calculate the average price of products in the addagroproducts table:
SELECT
  AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2))) AS avg_price,
  MIN(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2))) AS min_price,
  MAX(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2))) AS max_price
FROM
  addagroproducts;

--Count the number of farming types in the farming table:
SELECT COUNT(*) AS farming_type_count FROM farming;

--Find the maximum age of farmers in the register table:
SELECT MAX(age) AS max_age FROM register;

--Calculate the total number of tests in the test table:
SELECT COUNT(*) AS total_tests FROM test;

--Find the earliest timestamp among triggers in the trig table:
SELECT MIN(timestamp) AS earliest_timestamp FROM trig;

--Calculate the total number of users in the user table:
SELECT COUNT(*) AS total_users FROM user;

--Calculate the sum of ages for all farmers in the register table:
SELECT SUM(age) AS total_age FROM register;

--Get the number of products listed by each user in the addagroproducts table:
SELECT username, COUNT(pid) AS product_count
FROM addagroproducts
GROUP BY username;


--Find the product with the highest price in the addagroproducts table:
SELECT *
FROM addagroproducts
WHERE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2)) = (
    SELECT MAX(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2)))
    FROM addagroproducts
);


--DQL of simple join operations

--Join addagroproducts and register tables to get products along with farmer details:
SELECT addagroproducts.*, register.farmername, register.age
FROM addagroproducts
JOIN register ON addagroproducts.username = register.farmername;

--Join farming and register tables to get farmers along with their associated farming types:
SELECT register.farmername,farming.farmingtype
FROM register
JOIN farming ON register.rid = farming.fid;

--Join trig and register tables to get triggers along with farmer details:
SELECT trig.*, register.farmername
FROM trig
JOIN register ON trig.fid = register.rid;

--Join addagroproducts, register, and farming tables to get products along with farmer details and farming types:
SELECT register.farmername, farming.farmingtype,addagroproducts.productname
FROM addagroproducts
JOIN register ON addagroproducts.username = register.farmername
JOIN farming ON register.rid = farming.fid;

--Retrieve the farming type associated with the youngest farmer in the register table:
SELECT register.farmername,farming.farmingtype
FROM farming
JOIN register ON farming.fid = register.rid
ORDER BY register.age ASC
LIMIT 1;


--DQL of Subqueries

--Find farmers who have registered and are associated with agriculture in the register table:
SELECT *
FROM register
WHERE farming IN (SELECT farmingtype FROM farming);

--Find the products with a price higher than the average price in the addagroproducts table:
SELECT *
FROM addagroproducts
WHERE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2)) > (
    SELECT AVG(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2)))
    FROM addagroproducts
);

--Find users who are not associated with agriculture in the user table:
SELECT *
FROM user
WHERE username IN (SELECT username FROM user WHERE is_agrarian=0);


--Functions

--function that retrieves the total number of registered farmers for a given farming type from the provided tables (register and farming tables). The function will take the farming type as an input parameter and return the count.

-- Create the farming_count function
DELIMITER //

CREATE or replace FUNCTION farming_count(farming_type_input varchar(200))
RETURNS INT
BEGIN
    DECLARE count_result INT;

    -- Use a subquery to count the number of farmers with the given farming type
    SELECT COUNT(*) INTO count_result
    FROM register
    WHERE farming = (SELECT farmingtype FROM farming WHERE farmingtype = farming_type_input);

    -- Return the count
    RETURN count_result;
END //

DELIMITER ;

-- Example usage of the farming_count function
SELECT farming_count('Type1') AS farmer_count_for_type1;

--function that calculates the average age of farmers based on a given farming type.

-- Create the average_age_for_farming_type function
DELIMITER //

CREATE FUNCTION average_age_for_farming_type(farming_type_input varchar(200))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE avg_age_result DECIMAL(10,2);

    -- Use a subquery to calculate the average age of farmers with the given farming type
    SELECT AVG(age) INTO avg_age_result
    FROM register
    WHERE farming = (SELECT farmingtype FROM farming WHERE farmingtype = farming_type_input);

    -- Return the average age
    RETURN avg_age_result;
END //

DELIMITER ;


-- Example usage of the average_age_for_farming_type function
SELECT average_age_for_farming_type('Type1') AS avg_age_for_type1;


--Stored procedures

--a stored procedure that calculates and returns the total value of all products for a given user in the addagroproducts table

-- Create the calculate_total_value stored procedure
DELIMITER //

CREATE PROCEDURE calculate_total_value(
    IN username_input VARCHAR(50),
    OUT total_value DECIMAL(10,2)
)
BEGIN
    -- Calculate the total value of all products for the specified user
    SELECT SUM(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(price, '₹', -1), ' ', 1) AS DECIMAL(10, 2))) INTO total_value
    FROM addagroproducts
    WHERE username = username_input;
END //

DELIMITER ;

-- Example usage of the calculate_total_value stored procedure
CALL calculate_total_value('example_username', @total_value);
SELECT @total_value AS total_product_value;