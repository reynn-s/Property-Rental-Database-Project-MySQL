# Database Schema Documentation
## ERD
![Example Image](https://github.com/reynn-s/Property-Rental-Database-Project-MySQL/blob/main/docs/ERD.jpg)
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
**Columns**
| Field                   | Type          | Null | Key  | Default           | Extra             |
|-------------------------|---------------|------|------|-------------------|-------------------|
| listing_id              | int           | NO   | PRI  | null              | auto_increment    |
| owner_id                | int           | NO   | MUL  | null              |                   |
| property_type_id        | int           | NO   | MUL  | null              |                   |
| listing_title           | varchar(100)  | NO   | UNI  | null              |                   |
| listing_description     | varchar(100)  | NO   |      | null              |                   |
| listing_location        | varchar(100)  | NO   | MUL  | null              |                   |
| listing_price_per_night | double        | NO   | MUL  | null              |                   |
| listing_max_guests      | int           | NO   |      | null              |                   |
| listing_date_listed     | timestamp     | NO   |      | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
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
The Photos table stores images associated with listings. Each photo is linked to a listing through listing_id and includes information like the URL of the photo and the date it was uploaded.
**Columns**
| Field              | Type          | Null | Key  | Default           | Extra             |
|--------------------|---------------|------|------|-------------------|-------------------|
| photo_id           | int           | NO   | PRI  | null              | auto_increment    |
| listing_id         | int           | NO   | MUL  | null              |                   |
| photo_url          | text          | NO   |      | null              |                   |
| photo_upload_date  | timestamp     | NO   |      | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
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
The Property_Types table defines various categories of properties (e.g., apartments, houses, villas) available on the platform. Each type is uniquely identified by property_type_id and includes a name and a brief description.
**Columns**
| Field                | Type          | Null | Key  | Default | Extra          |
|----------------------|---------------|------|------|---------|----------------|
| property_type_id     | int           | NO   | PRI  | null    | auto_increment |
| property_type_name   | varchar(100)  | NO   | UNI  | null    |                |
| property_description | varchar(255)  | NO   |      | null    |                |
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
The Owners table contains information about property owners who list their properties on the platform. Each owner has a unique identifier (owner_id) and records their name, email, phone number, and the date they registered on the platform.
**Columns**
| Field               | Type           | Null | Key  | Default           | Extra              |
|---------------------|----------------|------|------|-------------------|--------------------|
| `user_id`           | int            | NO   | PRI  | null              | auto_increment     |
| `user_name`         | varchar(100)   | NO   | UNI  | null              |                    |
| `user_email`        | varchar(100)   | NO   |      | null              |                    |
| `user_phone_number` | varchar(100)   | NO   |      | null              |                    |
| `user_date_created` | timestamp      | NO   |      | CURRENT_TIMESTAMP | DEFAULT_GENERATED  |
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
The Reservations table records booking details for listings. Each reservation has a unique ID (reservation_id) and includes information about the listing, user, check-in and check-out dates, total price, status, and the date the reservation was created.
**Columns**
| Field                        | Type          | Null | Key  | Default           | Extra             |
|------------------------------|---------------|------|------|-------------------|-------------------|
| reservation_id               | int           | NO   | PRI  | null              | auto_increment    |
| listing_id                   | int           | NO   | MUL  | null              |                   |
| user_id                      | int           | NO   | MUL  | null              |                   |
| reservation_check_in_date    | date          | NO   | MUL  | null              |                   |
| reservation_check_out_date   | date          | NO   |      | null              |                   |
| reservation_total_price      | double        | NO   |      | null              |                   |
| reservation_status           | varchar(20)   | NO   | MUL  | null              |                   |
| reservation_date_created     | timestamp     | NO   |      | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
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
The Payments table tracks all payment transactions associated with reservations. Each payment is identified by a unique ID (payment_id) and includes details about the reservation, payment method, date, and status.
**Columns**
| Field            | Type         | Null | Key  | Default | Extra          |
|------------------|--------------|------|------|---------|----------------|
| `payment_id`     | int          | NO   | PRI  | null    | auto_increment |
| `reservation_id` | int          | NO   | MUL  | null    |                |
| `payment_method` | varchar(20)  | NO   |      | null    |                |
| `payment_date`   | date         | NO   |      | null    |                |
| `payment_status` | varchar(20)  | NO   |      | null    |                |
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
The Users table stores information about people using the platform to book properties. Each user has a unique identifier (user_id) and includes their name, email, phone number, and the date they joined the platform.
**Columns**
| Field              | Type          | Null | Key  | Default           | Extra             |
|--------------------|---------------|------|------|-------------------|-------------------|
| user_id            | int           | NO   | PRI  | null              | auto_increment    |
| user_name          | varchar(100)  | NO   | UNI  | null              |                   |
| user_email         | varchar(100)  | NO   |      | null              |                   |
| user_phone_number  | varchar(100)  | NO   |      | null              |                   |
| user_date_created  | timestamp     | NO   |      | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
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
The Reviews table contains feedback provided by users for listings. Each review is uniquely identified by review_id and includes the user, listing, comment, and the date the review was created.
**Columns**
| Field                 | Type          | Null | Key  | Default           | Extra             |
|-----------------------|---------------|------|------|-------------------|-------------------|
| review_id             | int           | NO   | PRI  | null              | auto_increment    |
| user_id               | int           | NO   | MUL  | null              |                   |
| listing_id            | int           | NO   | MUL  | null              |                   |
| review_comment        | text          | NO   |      | null              |                   |
| review_date_created   | timestamp     | NO   |      | CURRENT_TIMESTAMP | DEFAULT_GENERATED |

## Relationships
- Users -> Reviews: One-to-Many (one user can write many reviews)
- Users -> Reservations: One-to-Many (one user can make many reservations)
- Listings -> Reviews: One-to-Many (one listing can have many reviews)
- Listings -> Reservations: One-to-Many (one listing can have many reservations)
- Listings -> Photos: One-to-Many (one listing can have many photos)
- Listings -> Property_Types: Many-to-One (many listings can have one property type)
- Owners -> Listings: One-to-Many (one owner can have many listings)
- Reservations -> Payments: One-to-One (each reservation has one payment)

## Constraints
### Foreign Key Constraints
```
ALTER TABLE Reservations
  ADD CONSTRAINT FK_Listings_TO_Reservations
    FOREIGN KEY (listing_id)
    REFERENCES Listings (listing_id);
```
```
ALTER TABLE Reservations
  ADD CONSTRAINT FK_Users_TO_Reservations
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id);
```
```
ALTER TABLE Payments
  ADD CONSTRAINT FK_Reservations_TO_Payments
    FOREIGN KEY (reservation_id)
    REFERENCES Reservations (reservation_id);
```
```
ALTER TABLE Listings
  ADD CONSTRAINT FK_Property_Types_TO_Listings
    FOREIGN KEY (property_type_id)
    REFERENCES Property_Types (property_type_id);
```
```
ALTER TABLE Listings
  ADD CONSTRAINT FK_Owners_TO_Listings
    FOREIGN KEY (owner_id)
    REFERENCES Owners (owner_id);
```
```
ALTER TABLE Reviews
  ADD CONSTRAINT FK_Listings_TO_Reviews
    FOREIGN KEY (listing_id)
    REFERENCES Listings (listing_id);
```
```
ALTER TABLE Photos
  ADD CONSTRAINT FK_Listings_TO_Photos
    FOREIGN KEY (listing_id)
    REFERENCES Listings (listing_id);
```
```
ALTER TABLE Reviews
  ADD CONSTRAINT FK_Users_TO_Reviews
    FOREIGN KEY (user_id)
    REFERENCES Users (user_id);
```
## Check Constraints
```
ALTER TABLE Listings
  ADD CONSTRAINT chk_listing_price 
    CHECK (listing_price_per_night > 0);
```
```
ALTER TABLE Reservations
  ADD CONSTRAINT chk_reservation_status
    CHECK (reservation_status IN ('Booked', 'CheckedIn', 'Completed', 'Cancelled'));
```
```
ALTER TABLE Listings
  ADD CONSTRAINT chk_max_guests 
    CHECK (listing_max_guests > 0);
```
```
ALTER TABLE Payments
    ADD CONSTRAINT chk_payment_status
        CHECK (payment_status IN ('Paid', 'Pending', 'Refunded'));
```
```
ALTER TABLE Payments
    ADD CONSTRAINT chk_payment_method
        CHECK (payment_method IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer'));
```
### Unique Constraint
```
ALTER TABLE Listings
  ADD CONSTRAINT UQ_listing_title UNIQUE (listing_title);
```
```
ALTER TABLE Owners
  ADD CONSTRAINT UQ_owner_email UNIQUE (owner_email);
```
```
ALTER TABLE Property_Types
  ADD CONSTRAINT UQ_property_type_name UNIQUE (property_type_name);
```
```
ALTER TABLE Users
  ADD CONSTRAINT UQ_user_name UNIQUE (user_name);
```
