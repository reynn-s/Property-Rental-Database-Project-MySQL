-- AddOwner: Creates a new owner record
CREATE PROCEDURE AddOwner (
 IN OwName VARCHAR(100),
 IN OwEmail VARCHAR(100), 
 IN OwPNumber VARCHAR(100)
)
BEGIN
 INSERT INTO owners (owner_name, owner_email, owner_phone_number)
 VALUES (OwName, OwEmail, OwPNumber);
 SELECT 'Owner added successfully' AS Message;
END;

-- AddUser: Creates a new user record
CREATE PROCEDURE AddUser (
 IN UsName VARCHAR(100),
 IN UsEmail VARCHAR(100),
 IN UsPNumber VARCHAR(100)
)
BEGIN
 INSERT INTO users (user_name, user_email, user_phone_number)
 VALUES (UsName, UsEmail, UsPNumber);
 SELECT 'User added successfully' AS Message;
END;
