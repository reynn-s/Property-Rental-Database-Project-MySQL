-- Update the payment_status column on payments table to refunded after reservation_status is cancelled
CREATE TRIGGER update_payment_on_reservation_cancel
AFTER UPDATE ON Reservations
FOR EACH ROW
BEGIN
    IF NEW.reservation_status = 'Cancelled' AND OLD.reservation_status != 'Cancelled' THEN
        UPDATE Payments
        SET 
            payment_status = 'Refunded',
            payment_date = CURRENT_DATE()
        WHERE reservation_id = NEW.reservation_id;
    END IF;
END;

-- Preventing duplicate photo
CREATE TRIGGER prevent_duplicate_photo
BEFORE INSERT ON photos
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM photos WHERE photo_url = NEW.photo_url) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate photo url detected';
    END IF;
END;
