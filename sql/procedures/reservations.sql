-- AddReservation: Creates a new reservation with availability check
CREATE PROCEDURE AddReservation(
    IN UserFullName VARCHAR(100),
    IN ListingTitle VARCHAR(100),
    IN CheckInDate DATE,
    IN CheckOutDate DATE,
    IN CurrentDate DATE
)
BEGIN
    DECLARE UserId INT;
    DECLARE ListingId INT;
    DECLARE TotalPrice DOUBLE;

    IF CurrentDate IS NULL THEN
        SET CurrentDate = CURDATE();
    END IF;

    IF CheckInDate >= CheckOutDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Check-in date must be before check-out date';
    END IF;

    IF CheckInDate < CurrentDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot make reservations for past dates';
    END IF;

    SELECT user_id 
    INTO UserId
    FROM Users
    WHERE user_name = UserFullName;

    IF UserId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User not found. Please add the user first.';
    END IF;

    SELECT listing_id 
    INTO ListingId
    FROM Listings
    WHERE listing_title = ListingTitle;

    IF ListingId IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Listing title not found. Please provide a valid listing title.';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM Reservations
        WHERE listing_id = ListingId
        AND reservation_status != 'Cancelled'
        AND (
            (CheckInDate < reservation_check_out_date AND CheckOutDate > reservation_check_in_date)
        )
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Listing is not available for these dates.';
    END IF;

    SELECT listing_price_per_night * DATEDIFF(CheckOutDate, CheckInDate)
    INTO TotalPrice
    FROM Listings
    WHERE listing_id = ListingId;

    INSERT INTO Reservations (listing_id, user_id, reservation_check_in_date, reservation_check_out_date, reservation_total_price, reservation_status)
    VALUES (ListingId, UserId, CheckInDate, CheckOutDate, TotalPrice, 'Booked');
    
    SELECT 'Reservation added successfully' AS Message;
END;

-- CancelReservation: Cancel the reservation
CREATE PROCEDURE CancelReservation(
    IN ReservationId INT
)
BEGIN
    DECLARE ReservationStatus VARCHAR(50);

    SELECT reservation_status 
    INTO ReservationStatus
    FROM Reservations
    WHERE reservation_id = ReservationId

    IF ReservationStatus IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation not found';
    END IF;

    IF ReservationStatus = 'Completed' OR ReservationStatus = 'Cancelled' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot cancel a completed or already cancelled reservation';
    END IF;

    UPDATE Reservations
    SET reservation_status = 'Cancelled'
    WHERE reservation_id = ReservationId;

    SELECT 'Reservation cancelled successfully' AS Message;
END;

-- HandleCheckIn: Confirm user for check in
CREATE PROCEDURE HandleCheckIn(
    IN ReservationID INT,
    IN CurrentDate DATE
)
BEGIN
    DECLARE current_status VARCHAR(20);
    DECLARE check_in_date DATE;
    
    SELECT reservation_status, reservation_check_in_date 
    INTO current_status, check_in_date
    FROM Reservations 
    WHERE reservation_id = ReservationID;
    
    IF current_status IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation not found';
    ELSEIF current_status != 'Booked' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation must be in Booked status to check in';
    ELSEIF check_in_date > CurrentDate THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot check in before the scheduled check-in date';
    ELSE
        UPDATE Reservations
        SET reservation_status = 'CheckedIn'
        WHERE reservation_id = ReservationID;
        
        SELECT 'Check-in processed successfully' AS Message;
    END IF;
END;

-- HandleCheckOut: Confirm user for check out
CREATE PROCEDURE HandleCheckOut(
    IN ReservationID INT,
    IN CurrentDate DATE
)
BEGIN
    DECLARE current_status VARCHAR(20);
    DECLARE check_out_date DATE;
    
    SELECT reservation_status, reservation_check_out_date 
    INTO current_status, check_out_date
    FROM Reservations 
    WHERE reservation_id = ReservationID;
    
    IF current_status IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation not found';
    ELSEIF current_status != 'CheckedIn' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation must be in CheckedIn status to check out';
    ELSEIF CurrentDate < check_out_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot check out before scheduled check-out date';
    ELSE
        UPDATE Reservations
        SET reservation_status = 'Completed'
        WHERE reservation_id = ReservationID;
        
        SELECT 'Check-out processed successfully' AS Message;
    END IF;
END;
