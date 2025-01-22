CREATE PROCEDURE AddPayment(
    IN ReservationID INT,
    IN PayMethod VARCHAR(20)
)
BEGIN

    IF PayMethod NOT IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid payment method';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM Reservations WHERE reservation_id = ReservationID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reservation not found';
    END IF;

    IF EXISTS (SELECT 1 FROM Payments WHERE reservation_id = ReservationID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment already exists for this reservation';
    END IF;

    IF PaymentDate IS NULL THEN
        SET PaymentDate = CURDATE();
    END IF;

    INSERT INTO Payments (reservation_id, payment_method, payment_date, payment_status)
    VALUES (ReservationID, PayMethod, CURDATE(), 'Paid');
    
    SELECT 'Payment added successfully' AS Message;
END;
