-- Unique Constraints Section
ALTER TABLE Property_Types
  ADD CONSTRAINT UQ_property_type_name UNIQUE (property_type_name);

ALTER TABLE Owners
  ADD CONSTRAINT UQ_owner_email UNIQUE (owner_email);

ALTER TABLE Listings
  ADD CONSTRAINT UQ_listing_title UNIQUE (listing_title);

ALTER TABLE Users
  ADD CONSTRAINT UQ_user_name UNIQUE (user_name);

-- Index Section
CREATE INDEX idx_reservation_status ON Reservations(reservation_status);
CREATE INDEX idx_listing_location ON Listings(listing_location);
CREATE INDEX idx_price ON Listings(listing_price_per_night);
CREATE INDEX idx_dates ON Reservations(reservation_check_in_date, reservation_check_out_date);
