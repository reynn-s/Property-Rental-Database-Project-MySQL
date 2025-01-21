-- AddListing: Creates a new property listing
CREATE PROCEDURE AddListing (
    IN OwnerFullName VARCHAR(100),
    IN ListingTitle VARCHAR(100),
    IN ListingDescription VARCHAR(255),
    IN ListingLocation VARCHAR(100),
    IN ListingPrice DOUBLE, 
    IN MaxGuests INT,
    IN PropertyTypeName VARCHAR(50)
)
BEGIN
    DECLARE OwnerID INT;
    DECLARE PropertyTypeID INT;

    SELECT owner_id 
    INTO OwnerID
    FROM Owners
    WHERE owner_name = OwnerFullName;

    IF OwnerID IS NULL THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Owner not found. Please add the owner first.';
    ELSE

        SELECT property_type_id 
        INTO PropertyTypeID
        FROM Property_Types
        WHERE property_type_name = PropertyTypeName;

        IF PropertyTypeID IS NULL THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Invalid property type. Please choose one of the following: "Villa", "House", "Apartment".';
        ELSE
            INSERT INTO Listings (owner_id, property_type_id, listing_title, listing_description, listing_location, listing_price_per_night, listing_max_guests)
            VALUES (OwnerID, PropertyTypeID, ListingTitle, ListingDescription, ListingLocation, ListingPrice, MaxGuests);
        END IF;
    END IF;
END;

-- AddPropertyType: Creates a new property type
CREATE PROCEDURE AddPropertyType(
    IN PropertyType VARCHAR (20),
    IN PropertyDesc VARCHAR (200)
)
BEGIN
INSERT INTO Property_Types (property_type_name, property_description) 
VALUES (PropertyType, PropertyDesc);
SELECT 'Property added succesfully' AS MESSAGE;
END;

-- AddPhotos: Adds a photo and associates it with a listing
CREATE PROCEDURE AddPhoto(
    IN ListingTitle VARCHAR(100),
    IN PhURL TEXT
)
BEGIN
    DECLARE ListingID INT;

    SELECT listing_id
    INTO ListingID
    FROM Listings
    WHERE listing_title = ListingTitle;

    IF ListingID IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Listing title not found';
    END IF;

    INSERT INTO Photos (listing_id, photo_url)
    VALUES (ListingID, PhURL);
END;

-- AddReview: Adds a review and associates it with listing and user
CREATE PROCEDURE AddReview(
    IN UserFullName VARCHAR(100),     
    IN ListingTitle VARCHAR(100),     
    IN ReviewComment TEXT             
)
BEGIN
    DECLARE UserId INT;
    DECLARE ListingId INT;

    SELECT user_id 
    INTO UserId
    FROM Users
    WHERE user_name = UserFullName;
    
    IF UserId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User not found. Please check the name and try again.';
    END IF;

    SELECT listing_id 
    INTO ListingId
    FROM Listings
    WHERE listing_title = ListingTitle;
    
    IF ListingId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Listing not found. Please check the listing title and try again.';
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM Reservations
        WHERE user_id = UserId 
        AND listing_id = ListingId
        AND reservation_status = 'Completed'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You can only review properties where you have completed a stay.';
    END IF;

    INSERT INTO Reviews (user_id, listing_id, review_comment) 
    VALUES (UserId, ListingId, ReviewComment);

    SELECT 'Review added successfully' AS Message;
END;
