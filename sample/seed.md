# Sample for calling each procedure
This markdown will give an example for each procedure function and how to call it.
## AddUser Procedure (User full name, User email, User phone number)
```
-- Insert Users
CALL AddUser ('Reyandanu Fajri', 'reyandanu@gmail.com', '0855389021');
CALL AddUser ('Haikal Rayhan', 'haikal@gmail.com', '0821489302');
CALL AddUser ('Muhammad Yanuar', 'yanuar@gmail.com', '0812456327');
CALL AddUser ('Abdul Salim', 'salim@gmail.com', '0815432789');
CALL AddUser ('Ahmad Salaudin', 'ahmad@gmail.com', '0854389032');
```
## AddOwner Procedure (Owner full name, Owner email, Owner phone number)
```
-- Insert Owners
CALL AddOwner ('Raden Jaya', 'raden@gmail.com', '0843728943');
CALL AddOwner ('Budi Santoso', 'budi@gmail.com', '0833829102');
CALL AddOwner ('Arief Hadi', 'arief@gmail.com', '0832178983');
CALL AddOwner ('Bayu Prasetya', 'bayu@gmail.com', '0823389021');
CALL AddOwner ('Wira Gama', 'wira@gmail.com', '0882319803');
```
## AddPropertyType Procedure (Property Type, Property Description)
```
-- Insert Property Types
CALL AddPropertyType ('Villa', 'A large, fancy home with lots of space. Villas often have private gardens, swimming pools, and are great for relaxing in peaceful locations.');
CALL AddPropertyType ('House', 'A regular family home. It usually has a yard and enough space for a small or medium-sized family.');
CALL AddPropertyType ('Apartment', 'A small home inside a building with many other homes. Apartments are good for one person, couples, or small families and often share things like parking or elevators.');
```
## AddListing Procedure (Owner full name, Listing name, Listing description, Location, Price, Max gueast, Property Type)
```
-- Insert Listings
CALL AddListing ('Raden Jaya', 'Cozy Beach House', 'Beautiful beachfront property', 'Miami Beach, FL', 250.00, 6, 'House');
CALL AddListing ('Arief Hadi', 'Downtown Apartment', 'Modern city apartment', 'New York, NY', 150.00, 4, 'Apartment');
CALL AddListing ('Bayu Prasetya', 'Luxury Villa', 'Spacious villa with pool', 'Los Angeles, CA', 500.00, 8, 'Villa');
CALL AddListing ('Budi Santoso', 'Mountain House', 'Charming house nestled in the mountains with access to nature trails', 'Chicago, IL', 350.00, 5, 'House');
CALL AddListing ('Wira Gama', 'Skyline Villa', 'High-end villa with panoramic views of the city skyline', 'Aspen, CO', 400.00, 7, 'Villa');
```
## AddPhoto Procedure (Listing name, Listing URL)
```
-- Insert Photos
CALL AddPhoto ('Cozy Beach House', 'https://example.com/photos/CozyBeachHouse1.jpg');
CALL AddPhoto ('Cozy Beach House', 'https://example.com/photos/CozyBeachHouse2.jpg');
CALL AddPhoto ('Downtown Apartment', 'https://example.com/photos/DowntownApartment1.jpg');
CALL AddPhoto ('Downtown Apartment', 'https://example.com/photos/DowntownApartment2.jpg');
CALL AddPhoto ('Luxury Villa', 'https://example.com/photos/LuxuryVilla1.jpg');
CALL AddPhoto ('Luxury Villa', 'https://example.com/photos/LuxuryVilla2.jpg');
CALL AddPhoto ('Mountain House', 'https://example.com/photos/MountainHouse1.jpg');
CALL AddPhoto ('Mountain House', 'https://example.com/photos/MountainHouse2.jpg');
CALL AddPhoto ('Skyline Villa', 'https://example.com/photos/SkylineVilla1.jpg');
CALL AddPhoto ('Skyline Villa', 'https://example.com/photos/SkylineVilla2.jpg');
```
## AddReservation Procedure (User Full Name, Listing Name, Check In Date, Check Out Date)
```
-- Insert Reservations
CALL AddReservation ('Reyandanu Fajri', 'Luxury Villa', '2025-03-01', '2025-03-05');
CALL AddReservation ('Haikal Rayhan', 'Downtown Apartment', '2025-03-10', '2025-03-15');
CALL AddReservation ('Muhammad Yanuar', 'Mountain House', '2025-03-20', '2025-03-25');
CALL AddReservation ('Abdul Salim', 'Luxury Villa', '2025-03-25', '2025-04-01');
CALL AddReservation ('Ahmad Salaudin', 'Skyline Villa', '2025-03-27', '2025-04-01');
```
## AddPayment Procedure (User ID, Payment Method)
```
-- Insert Payments
CALL AddPayment (1, 'Debit Card');
CALL AddPayment (2, 'Bank Transfer');
CALL AddPayment (3, 'Credit Card');
CALL AddPayment (4, 'Bank Transfer');
CALL AddPayment (5, 'Bank Transfer');
```
## AddReview Procedure (User Full Name, Listing Name, User Review)
```
-- Insert Reviews
CALL AddReview('Haikal Rayhan', 'Downtown Apartment', 'Perfect location in the heart of the city. The apartment was clean, modern, and had all the amenities needed. Great value for money!');
CALL AddReview('Muhammad Yanuar', 'Mountain House', 'The mountain views were spectacular! The house was cozy and warm, perfect for our winter getaway. The hiking trails nearby were an added bonus.');
CALL AddReview('Abdul Salim','Luxury Villa','Wonderful beachfront property! Falling asleep to the sound of waves was magical. The house was well-maintained and had everything we needed.');
CALL AddReview('Ahmad Salaudin', 'Skyline Villa', 'Absolutely stunning property! The panoramic views of the city were incredible, especially at sunset. The amenities were top-notch and the service was excellent.');
```
## HandleCheckIn Procedure (Reservation ID, date for demo)
```
CALL HandleCheckIn (2, '2025-03-10');
```
## HandleCheckOut Procedure (Reservation ID, date for demo)
```
CALL HandleCheckOut (2, '2025-03-15');
```
## CancelReservation Procedure (Reservation ID)
```
CALL CancelReservation (5);
```
