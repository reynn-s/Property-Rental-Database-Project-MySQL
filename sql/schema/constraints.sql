-- Foreign Key Constraints Section
ALTER TABLE Reservations
  ADD CONSTRAINT FK_Listings_TO_Reservations
    FOREIGN KEY (listing_id)
    REFERENCES Listings (listing_id);

ALTER TABLE Reservations
  ADD CONSTRAINT FK_Users_TO_Reservations
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id);

ALTER TABLE Payments
  ADD CONSTRAINT FK_Reservations_TO_Payments
    FOREIGN KEY (reservation_id)
    REFERENCES Reservations (reservation_id);

ALTER TABLE Listings
  ADD CONSTRAINT FK_Property_Types_TO_Listings
    FOREIGN KEY (property_type_id)
    REFERENCES Property_Types (property_type_id);

ALTER TABLE Listings
  ADD CONSTRAINT FK_Owners_TO_Listings
    FOREIGN KEY (owner_id)
    REFERENCES Owners (owner_id);

ALTER TABLE Reviews
  ADD CONSTRAINT FK_Listings_TO_Reviews
    FOREIGN KEY (listing_id)
    REFERENCES Listings (listing_id);

ALTER TABLE Photos
  ADD CONSTRAINT FK_Listings_TO_Photos
    FOREIGN KEY (listing_id)
    REFERENCES Listings (listing_id);

ALTER TABLE Reviews
  ADD CONSTRAINT FK_Users_TO_Reviews
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id);

-- Check Constraints Section
ALTER TABLE Listings
  ADD CONSTRAINT chk_listing_price 
    CHECK (listing_price_per_night > 0);

ALTER TABLE Reservations
  ADD CONSTRAINT chk_reservation_status
    CHECK (reservation_status IN ('Booked', 'CheckedIn', 'Completed', 'Cancelled'));

ALTER TABLE Listings
  ADD CONSTRAINT chk_max_guests 
    CHECK (listing_max_guests > 0);

ALTER TABLE Payments
    ADD CONSTRAINT chk_payment_status
        CHECK (payment_status IN ('Paid', 'Pending', 'Refunded'));

ALTER TABLE Payments
    ADD CONSTRAINT chk_payment_method
        CHECK (payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer'));
