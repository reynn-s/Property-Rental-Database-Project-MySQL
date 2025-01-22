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
# Table: Payments
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
[Document all foreign key relationships]

## Constraints
[Document all check constraints and business rules]
