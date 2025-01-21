--Table Section
CREATE TABLE Listings
(
  listing_id              INT           NOT NULL AUTO_INCREMENT,
  owner_id                INT           NOT NULL,
  property_type_id        INT           NOT NULL,
  listing_title           VARCHAR (100) NOT NULL,
  listing_description     VARCHAR (100) NOT NULL,
  listing_location        VARCHAR (100) NOT NULL,
  listing_price_per_night DOUBLE        NOT NULL,
  listing_max_guests      INT           NOT NULL,
  listing_date_listed     TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (listing_id)
);

CREATE TABLE Owners
(
  owner_id           INT           NOT NULL AUTO_INCREMENT,
  owner_name         VARCHAR (100) NOT NULL,
  owner_email        VARCHAR (100) NOT NULL,
  owner_phone_number VARCHAR (100) NOT NULL,
  owner_date_created TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (owner_id)
);

CREATE TABLE Payments
(
  payment_id     INT          NOT NULL AUTO_INCREMENT,
  reservation_id INT          NOT NULL,
  payment_method VARCHAR (20) NOT NULL,
  payment_date   DATE         NOT NULL,
  payment_status VARCHAR (20) NOT NULL,
  PRIMARY KEY (payment_id)
);

CREATE TABLE Photos
(
  photo_id          INT       NOT NULL AUTO_INCREMENT,
  listing_id        INT       NOT NULL,
  photo_url         TEXT      NOT NULL,
  photo_upload_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (photo_id)
);

CREATE TABLE Property_Types
(
  property_type_id     INT           NOT NULL AUTO_INCREMENT,
  property_type_name   VARCHAR (100) NOT NULL,
  property_description VARCHAR (255) NOT NULL,
  PRIMARY KEY (property_type_id)
);

CREATE TABLE Reservations
(
  reservation_id             INT          NOT NULL AUTO_INCREMENT,
  listing_id                 INT          NOT NULL,
  user_id                    INT          NOT NULL,
  reservation_check_in_date  DATE         NOT NULL,
  reservation_check_out_date DATE         NOT NULL,
  reservation_total_price    DOUBLE       NOT NULL,
  reservation_status         VARCHAR (20) NOT NULL,
  reservation_date_created   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (reservation_id)
);

CREATE TABLE Reviews
(
  review_id           INT       NOT NULL AUTO_INCREMENT,
  user_id             INT       NOT NULL,
  listing_id          INT       NOT NULL,
  review_comment      TEXT      NOT NULL,
  review_date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (review_id)
);

CREATE TABLE Users
(
  user_id           INT           NOT NULL AUTO_INCREMENT,
  user_name         VARCHAR (100) NOT NULL,
  user_email        VARCHAR (100) NOT NULL,
  user_phone_number VARCHAR (100) NOT NULL,
  user_date_created TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
);
