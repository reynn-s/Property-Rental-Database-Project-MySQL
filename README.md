# Property Rental System Database

A MySQL database system designed to manage property rentals. The system handles properties, bookings, users, payments, and reviews with comprehensive data validation.

## 🏠 Features

### Technical Implementation
- **Tables**: 8 normalized tables with proper relationships
- **Stored Procedures**: 11 procedures handling all major operations
- **Triggers**: 6 triggers for data validation and automated updates
- **Views**: 2 views for simplified data access
- **Constraints**: Multiple check constraints ensuring data integrity

## 📋 Database Schema

### Main Tables
- `Listings`: Property listings with details
- `Users`: System users (renters)
- `Owners`: Property owners
- `Reservations`: Booking information
- `Payments`: Payment records
- `Reviews`: User reviews
- `Photos`: Property photos
- `Property_Types`: Categories of properties

## 🔧 Stored Procedures

### User Management
- `AddUser`: Create new user accounts
- `AddOwner`: Register property owners
- `UpdateUserStatus`: Manage user account status
- `UpdateOwnerStatus`: Manage owner account status

### Property Management
- `AddListing`: Create new property listings
- `AddPropertyType`: Define new property categories
- `AddPhoto`: Upload property photos

### Booking System
- `AddReservation`: Create new bookings with availability checks
- `HandleCheckIn`: Process guest check-ins
- `HandleCheckOut`: Process guest check-outs
- `CancelReservation`: Handle booking cancellations

### Reviews & Payments
- `AddReview`: Submit property reviews
- `AddPayment`: Process booking payments

## 🛡️ Data Validation

### Email Validation
- Regex pattern ensures valid email formats
- Prevents duplicate email addresses

### Phone Number Validation
- Ensures proper phone number format
- Length and character restrictions

### Business Rules
- Prevents double bookings
- Validates check-in/check-out dates
- Ensures payment status consistency
- Prevents duplicate photo uploads

## 🚀 Usage Examples

```sql
-- Add a new user
CALL AddUser('John Doe', 'john@example.com', '1234567890');

-- Create a property listing
CALL AddListing('Owner Name', 'Beach House', 'Beautiful beachfront property', 
                'Miami Beach', 250.00, 6, 'House');

-- Make a reservation
CALL AddReservation('John Doe', 'Beach House', '2025-03-01', '2025-03-05', 
                    CURRENT_DATE);
```

## 📄 License

[MIT License](LICENSE)
