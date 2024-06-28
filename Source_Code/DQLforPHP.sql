/* DQL with where conditions */
SELECT * FROM addagroproducts WHERE username = 'example_username';
SELECT * FROM farming WHERE fid = 1;
SELECT * FROM register WHERE adharnumber = '123456789012';
SELECT * FROM test WHERE id = 1;
SELECT * FROM trig WHERE fid = 'example_farmer_id';
SELECT * FROM user WHERE username = 'example_user';
SELECT * FROM user WHERE is_agrarian = TRUE;
SELECT * FROM user WHERE is_admin = TRUE;

/* DQL with aggregate functions */
SELECT AVG(price) AS average_price FROM addagroproducts;
SELECT COUNT(*) AS farming_type_count FROM farming;
SELECT MAX(age) AS max_age FROM register;
SELECT COUNT(*) AS total_tests FROM test;
SELECT MIN(timestamp) AS earliest_timestamp FROM trig;
SELECT COUNT(*) AS total_users FROM user;
SELECT SUM(age) AS total_age FROM register;
SELECT * FROM addagroproducts WHERE price = (SELECT MAX(price) FROM addagroproducts);

/* DQL of simple join operations */
SELECT addagroproducts.*, user.farmername, user.age
FROM addagroproducts
JOIN user ON addagroproducts.username = user.username;

SELECT register.*, farming.farmingtype
FROM register
JOIN farming ON register.farming = farming.fid;

SELECT trig.*, register.farmername
FROM trig
JOIN register ON trig.fid = register.rid;

SELECT user.*, register.address
FROM user
JOIN register ON user.username = register.username;

SELECT addagroproducts.*, register.farmername, farming.farmingtype
FROM addagroproducts
JOIN register ON addagroproducts.username = register.username
JOIN farming ON register.farming = farming.fid;

/* DQL of Subqueries */
SELECT *
FROM register
WHERE farming IN (SELECT farmingtype FROM farming);

SELECT *
FROM addagroproducts
WHERE price > (SELECT AVG(price) FROM addagroproducts);

SELECT farmingtype
FROM farming
WHERE fid = (SELECT rid FROM register ORDER BY age ASC LIMIT 1);

SELECT username, COUNT(pid) AS product_count
FROM addagroproducts
GROUP BY username;

SELECT *
FROM user
WHERE username NOT IN (SELECT username FROM register WHERE farming IS NOT NULL);

/* Functions */

/* Create the farming_count function */
DELIMITER //

CREATE FUNCTION farming_count(farming_type_input varchar(200))
RETURNS INT
BEGIN
    DECLARE count_result INT;
    SELECT COUNT(*) INTO count_result
    FROM register
    WHERE farming = (SELECT fid FROM farming WHERE farmingtype = farming_type_input);
    RETURN count_result;
END //

DELIMITER ;

/* Example usage of the farming_count function */
SELECT farming_count('Type1') AS farmer_count_for_type1;

/* Create the average_age_for_farming_type function */
DELIMITER //

CREATE FUNCTION average_age_for_farming_type(farming_type_input varchar(200))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE avg_age_result DECIMAL(10,2);
    SELECT AVG(age) INTO avg_age_result
    FROM register
    WHERE farming = (SELECT fid FROM farming WHERE farmingtype = farming_type_input);
    RETURN avg_age_result;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE calculate_total_value(IN username_input VARCHAR(50), OUT total_value DECIMAL(10,2))
BEGIN
    SELECT SUM(price) INTO total_value
    FROM addagroproducts
    WHERE username = username_input;
END //

DELIMITER ;
CALL calculate_total_value('example_username', @total_value);
SELECT @total_value AS total_product_value;


DELIMITER //

CREATE PROCEDURE get_farmers_by_age_and_type(IN min_age INT, IN farming_type_input VARCHAR(200))
BEGIN
    SELECT *
    FROM register
    WHERE age >= min_age AND farming = (SELECT fid FROM farming WHERE farmingtype = farming_type_input);
END //

DELIMITER ;