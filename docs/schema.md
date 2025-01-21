# Database Schema Documentation

## Tables

### • Listings
```
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
```
**Description:**
The Listings table stores information about properties listed on the platform. Each listing has a unique identifier (listing_id) and includes details like the owner, property type, title, description, location, price per night, maximum number of guests, and the date the listing was added to the platform.
### • Photos
```
CREATE TABLE Photos
(
  photo_id          INT       NOT NULL AUTO_INCREMENT,
  listing_id        INT       NOT NULL,
  photo_url         TEXT      NOT NULL,
  photo_upload_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (photo_id)
);
```
**Description:**
- a
### • Property_Types
```
CREATE TABLE Property_Types
(
  property_type_id     INT           NOT NULL AUTO_INCREMENT,
  property_type_name   VARCHAR (100) NOT NULL,
  property_description VARCHAR (255) NOT NULL,
  PRIMARY KEY (property_type_id)
);
```
**Description:**
- a
### • Owners
```
CREATE TABLE Owners
(
  owner_id           INT           NOT NULL AUTO_INCREMENT,
  owner_name         VARCHAR (100) NOT NULL,
  owner_email        VARCHAR (100) NOT NULL,
  owner_phone_number VARCHAR (100) NOT NULL,
  owner_date_created TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (owner_id)
);
```
**Description:**
- Contains owners who list their properties on the platform
- This records
### • Reservations
```
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
```
**Description:**
- a
### • Payments
```
CREATE TABLE Payments
(
  payment_id     INT          NOT NULL AUTO_INCREMENT,
  reservation_id INT          NOT NULL,
  payment_method VARCHAR (20) NOT NULL,
  payment_date   DATE         NOT NULL,
  payment_status VARCHAR (20) NOT NULL,
  PRIMARY KEY (payment_id)
);
```
**Description:**
- a
### • Users
```
CREATE TABLE Users
(
  user_id           INT           NOT NULL AUTO_INCREMENT,
  user_name         VARCHAR (100) NOT NULL,
  user_email        VARCHAR (100) NOT NULL,
  user_phone_number VARCHAR (100) NOT NULL,
  user_date_created TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
);
```
**Description:**
- a
### • Reviews
```
CREATE TABLE Reviews
(
  review_id           INT       NOT NULL AUTO_INCREMENT,
  user_id             INT       NOT NULL,
  listing_id          INT       NOT NULL,
  review_comment      TEXT      NOT NULL,
  review_date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (review_id)
);
```
**Description:**
- a

## Relationships
[Document all foreign key relationships]

## Constraints
[Document all check constraints and business rules]
