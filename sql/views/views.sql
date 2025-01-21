-- View Section
CREATE VIEW ListingDetailsView AS
SELECT
    l.listing_id,
    l.listing_title,
    l.listing_description,
    l.listing_location,
    l.listing_price_per_night,
    l.listing_max_guests,
    pt.property_type_name,
    o.owner_name,
    o.owner_email,
    GROUP_CONCAT(r.review_comment ORDER BY r.review_date_created DESC) AS review_comments,
    GROUP_CONCAT(p.photo_url ORDER BY p.photo_upload_date DESC) AS photo_urls
FROM Listings l
JOIN Property_Types pt ON l.property_type_id = pt.property_type_id
JOIN Owners o ON l.owner_id = o.owner_id
LEFT JOIN Reviews r ON l.listing_id = r.listing_id
LEFT JOIN Photos p ON l.listing_id = p.listing_id
GROUP BY l.listing_id, l.listing_title, l.listing_description, l.listing_location, l.listing_price_per_night, l.listing_max_guests, pt.property_type_name, o.owner_name, o.owner_email;

CREATE VIEW ReservationDetailsView AS
SELECT
    r.reservation_id,
    r.reservation_check_in_date,
    r.reservation_check_out_date,
    r.reservation_total_price,
    r.reservation_status,
    u.user_name,
    u.user_email,
    l.listing_title,
    l.listing_location
FROM Reservations r
JOIN Users u ON r.user_id = u.user_id
JOIN Listings l ON r.listing_id = l.listing_id;
