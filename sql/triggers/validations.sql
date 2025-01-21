-- Validate the user email so it matches with regular expression 
-- ^ - Start of string
-- [A-Za-z0-9._%+-]+ - Username part: letters, numbers, and common symbols
-- @ - Required @ symbol
-- [A-Za-z0-9.-]+ - Domain name: letters, numbers, dots, hyphens
-- \. - Required dot before extension
-- [A-Za-z]{2,} - Domain extension: 2 or more letters
-- $ - End of string
CREATE TRIGGER validate_user_email
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    IF NOT (NEW.user_email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid user email format.';
    END IF;
END;

-- Validate the owner email so it matches with the regular expression 
-- ^ - Start of string
-- [A-Za-z0-9._%+-]+ - Username part: letters, numbers, and common symbols
-- @ - Required @ symbol
-- [A-Za-z0-9.-]+ - Domain name: letters, numbers, dots, hyphens
-- \. - Required dot before extension
-- [A-Za-z]{2,} - Domain extension: 2 or more letters
-- $ - End of string
CREATE TRIGGER validate_owner_email
BEFORE INSERT ON Owners
FOR EACH ROW
BEGIN
    IF NOT (NEW.owner_email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid owner email format.';
    END IF;
END;

-- Validate the user phone number with the regular expression
-- ^ start of string
-- [0-9] Matches any digit from 0 to 9
-- {5,20} Specifies that the preceding pattern ([0-9]) must occur at least 5 times and at most 20 times
-- $ Asserts the end of the string
CREATE TRIGGER validate_user_phone
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    IF NOT (NEW.user_phone_number REGEXP '^[0-9]{5,20}$') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid user phone number format. Must be at least 5 digits.';
    END IF;
END;

-- Validate the owner phone number with the regular expression
-- ^ start of string
-- [0-9] Matches any digit from 0 to 9
-- {5,20} Specifies that the preceding pattern ([0-9]) must occur at least 5 times and at most 20 times
-- $ Asserts the end of the string
CREATE TRIGGER validate_owner_phone
BEFORE INSERT ON Owners
FOR EACH ROW
BEGIN
    IF NOT (NEW.owner_phone_number REGEXP '^[0-9]{5,20}$') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid owner phone number format. Must be at least 5 digits.';
    END IF;
END;
