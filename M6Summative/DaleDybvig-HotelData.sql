use DaleDybvigHotelDB;
/*
insert into guest (guestID, firstName, lastName, streetAddress, city, state, zip, phone) values
	(1, "Dale", "Dybvig", "44 44th Ave. S.", "Minneapolis", "MN", "55407", "444-444-4444"),
    (2, "Mack", "Simmer", "379 Old Shore St.", "Council Bluffs", "IA", "51501", "291-553-0508"),
	(3, "BettyAnn", "Seery", "750 Wintergreen Dr.", "Wasilla", "AK", "99654", "478-277-9632"),
    (4, "Duane", "Cullison", "9662 Foxrun Lane", "Harlingen", "TX", "78552", "308-494-0198"),
    (5, "Karie", "Yang", "937B W. Augusta Ave.", "West Deptford", "NJ", "08096", "214-730-0298"),
    (6, "Aurore", "Lipton", "762 Wild Rose St.", "Saginaw", "MI", "48601", "377-507-0974"),
    (7, "Zachery", "Luechtefeld", "7 Poplar Dr.", "Arvada", "CO", "80003", "814-485-2615"),
    (8, "Jeremiah", "Pendergrass", "70 Oakwood St.", "Zion", "IL", "60099", "279-491-0960"),
    (9, "Walter", "Holloway", "7556 Arrowhead St.", "Cumberland", "RI", "02864", "446-396-6785"),
    (10, "Wilfred", "Vise", "77 West Surrey Street", "Oswego", "NY", "13126", "834-727-1001"),
    (11, "Maritza", "Tilton", "939 Linda Road", "Burke", "VA", "22015", "446-351-6860"),
    (12, "Jolene", "Tison", "87 Queen St.", "Drexel Hill", "PA", "19026", "231-893-2755");
select * from guest;


insert into type (typeID, typeName, basePrice, pricePerExtraPerson, standardOccupancy, maximumOccupancy) values
	(1, "Single", 149.99, null, 2, 2),
    (2, "Double", 174.99, 10, 2, 4),
    (3, "Suite", 399.99, 20, 3, 8);
select * from type;
*/
/*
insert into amenities(amenityID, amenityName, amenityPrice) values
	(1, "Jacuzzi", 25),
	(2, "Microwave", null),
	(3, "Refrigerator", null);
select * from amenities;
*/
-- insert into room values
-- 	(1, 201, 0, 2),
--  (2, 202, 1, 2),
--  (3, 203, 0, 2),
--  (4, 204, 1, 2),
--  (5, 205, 0, 1),
--  (6, 206, 1, 1);
/*
	(7, 207, 0, 1),
    (8, 208, 1, 1),
    (9, 301, 0, 2),
    (10, 302, 1, 2),
    (11, 303, 0, 2),
    (12, 304, 1, 2),
    (13, 305, 0, 1),
    (14, 306, 1, 1),
    (15, 307, 0, 1),
    (16, 308, 1, 1),
    (17, 401, 1, 3),
    (18, 402, 1, 3);
select * from room;
*/
/*
 insert into reservation values 
 	(1, 1, 0, "2023-02-02", "2023-02-04", 2),
    (2, 2, 1, "2023-02-05", "2023-02-10", 3),
    (3, 2, 0, "2023-02-22", "2023-02-24", 4),
    (4, 2, 2, "2023-03-06", "2023-03-07", 5),
    (5, 1, 1, "2023-03-17", "2023-03-20", 1),
    (6, 3, 0, "2023-03-18", "2023-03-23", 6),
    (7, 2, 2, "2023-03-29", "2023-03-31", 7),
    (8, 2, 0, "2023-03-31", "2023-04-05", 8),
    (9, 1, 0, "2023-04-09", "2023-04-13", 9),
    (10, 1, 1, "2023-04-23", "2023-04-24", 10),
    (11, 2, 4, "2023-05-30", "2023-06-02", 11),
    (12, 2, 0, "2023-06-10", "2023-06-14", 12),
    (13, 1, 0, "2023-06-10", "2023-06-14", 12),
    (14, 3, 0, "2023-06-17", "2023-06-18", 6),
    (15, 2, 0, "2023-06-28", "2023-07-02", 1),
    (16, 3, 1, "2023-07-13", "2023-07-14", 9),
    (17, 4, 2, "2023-07-18", "2023-07-21", 10),
    (18, 2, 1, "2023-07-28", "2023-07-29", 3),
    (19, 1, 0, "2023-08-30", "2023-09-01", 3),
    (20, 2, 0, "2023-09-16", "2023-09-17", 2),
    (21, 2, 2, "2023-09-13", "2023-09-15", 5),
    (22, 2, 2, "2023-11-22", "2023-11-25", 4),
    (23, 2, 0, "2023-11-22", "2023-11-25", 2),
    (24, 2, 2, "2023-11-22", "2023-11-25", 2),
    (25, 2, 0, "2023-12-24", "2023-12-28", 11);
 select * from reservation;
 */
 /*
 insert into roomamenities values 
	(1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (3, 2),
    (4, 3),
    (5, 1),
    (5, 2),
    (5, 3),
    (6, 2),
    (6, 3),
    (7, 1),
    (7, 2),
    (7, 3),
    (8, 2),
    (8, 3),
    (9, 1),
    (9, 2),
    (10, 3),
    (11, 1),
    (11, 2),
    (12, 3),
    (13, 1),
    (13, 2),
    (13, 3),
    (14, 2),
    (14, 3),
    (15, 1),
    (15, 2),
    (15, 3),
    (16, 2),
    (16, 3);
 select * from roomAmenities;
 */
 -- insert into amenities values
-- 	(4, "Oven", null);
/*
insert into roomAmenities values 
	(17, 2),
    (17, 3),
    (17, 4),
    (18, 2),
    (18, 3),
    (18, 4);
 select * from roomAmenities;
 */
 /*
insert into roomReservation values
	(16, 1),
    (3, 2),
    (13, 3),
    (1, 4),
    (15, 5),
    (10, 6),
    (2, 7),
    (12, 8),
    (9, 9),
    (7, 10),
    (17, 11),
    (6, 12),
    (8, 13),
    (12, 14),
    (5, 15),
    (4, 16),
    (17, 17),
    (11, 18),
    (15, 19),
    (8, 20),
    (3, 21),
    (17, 22),
    (6, 23),
    (9, 24),
    (10, 25);
 select * from roomReservation;
 */
 -- delete from roomReservation where reservationID = 8;
 -- delete from reservation where guestID = 8;
 -- delete from guest where guestID = 8;
 -- select * from reservation;
 -- select * from guest;
 -- select * from roomReservation;
 /*update amenities set amenityPrice = 0 where amenityID = 2;
 update amenities set amenityPrice = 0 where amenityID = 3;
 update amenities set amenityPrice = 0 where amenityID = 4;
 select * from amenities;
 update type set pricePerExtraPerson = 0 where typeID = 1;
 select * from type;*/
 select * from reservation r
    join roomReservation on roomReservation.reservationID = r.reservationID
    join room on room.roomID = roomReservation.roomID
    join type on room.typeID = type.typeID;