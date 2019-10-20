use DaleDybvigHotelDB;
-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
select g.firstName, g.lastName, r.startDate, r.endDate, room.roomNumber 
	from reservation r
	join guest g on r.guestID = g.guestID
    join roomReservation on roomReservation.reservationID = r.reservationID
    join room on room.roomID = roomReservation.roomID
    where r.endDate like "2023-07%";
/*Dale	Dybvig	2023-06-28	2023-07-02	205
Walter	Holloway	2023-07-13	2023-07-14	204
Wilfred	Vise	2023-07-18	2023-07-21	401
BettyAnn	Seery	2023-07-28	2023-07-29	303 */

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
select g.firstName, g.lastName, r.startDate, r.endDate
	from reservation r
    join guest g on r.guestID = g.guestID
    join roomReservation on roomReservation.reservationID = r.reservationID
    join room on room.roomID = roomReservation.roomID
    join roomAmenities on room.roomID = roomAmenities.roomID
    join amenities on amenities.amenityID = roomAmenities.amenityID
    where amenities.amenityID = 1;
    /*Karie	Yang	2023-03-06	2023-03-07
BettyAnn	Seery	2023-02-05	2023-02-10
Karie	Yang	2023-09-13	2023-09-15
Dale	Dybvig	2023-06-28	2023-07-02
Wilfred	Vise	2023-04-23	2023-04-24
Walter	Holloway	2023-04-09	2023-04-13
Mack	Simmer	2023-11-22	2023-11-25
BettyAnn	Seery	2023-07-28	2023-07-29
Duane	Cullison	2023-02-22	2023-02-24
Dale	Dybvig	2023-03-17	2023-03-20
BettyAnn	Seery	2023-08-30	2023-09-01 */
-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
-- the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
select g.firstName, g.lastName, room.roomNumber, r.startDate, r.numAdults+r.numChildren totalPeople
	from reservation r
    join guest g on r.guestID = g.guestID
    join roomReservation on roomReservation.reservationID = r.reservationID
    join room on room.roomID = roomReservation.roomID
    where g.lastName = "Simmer";
-- not sure if I was supposed to include a calculated column for adults+children here.
    /*Mack	Simmer	308	2023-02-02	1	0
Mack	Simmer	208	2023-09-16	2	0
Mack	Simmer	206	2023-11-22	2	0
Mack	Simmer	301	2023-11-22	2	2
-- anyway, here it is with a calculated totalPeople column.
Mack	Simmer	308	2023-02-02	1
Mack	Simmer	208	2023-09-16	2
Mack	Simmer	206	2023-11-22	2
Mack	Simmer	301	2023-11-22	4 */
-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.
select room.roomNumber, r.reservationID, t.basePrice, t.pricePerExtraPerson, a.amenityPrice, r.startDate, r.endDate,
datediff(r.endDate, r.startDate)*(t.basePrice+a.amenityPrice+((r.numAdults-t.standardOccupancy)*t.pricePerExtraPerson)) totalCost
	from room
    left outer join type t on room.typeID = t.typeID
    left outer join roomAmenities on roomAmenities.roomID = room.roomID
    left outer join amenities a on roomAmenities.amenityID = a.amenityID
    left outer join roomReservation on roomReservation.roomID = room.roomID
    left outer join reservation r on r.reservationID = roomReservation.reservationID
    group by r.reservationID
    order by r.reservationID;
-- right now this is returning the unreserved room number 306 but not 402 and i have no idea why
-- this should give a list that's exactly as long as the reservations but with null rows for rooms 306 and 402 for a total of 26 rows (it's 25 right now)
-- reservations 9, 11, and 22 are slightly off from what's on the assessment page and I think it's due to small errors either on my end or theirs
-- they are lower by 40, 60, and 60 bucks respectively which would correspond to having one additional adult in the room for that number of nights, but none of those reservations includes an extra adult
-- here is the result:
/*306		149.99	0.00	0.00			
308	1	149.99	0.00	0.00	2023-02-02	2023-02-04	299.98
203	2	174.99	10.00	25.00	2023-02-05	2023-02-10	999.95
305	3	149.99	0.00	25.00	2023-02-22	2023-02-24	349.98
201	4	174.99	10.00	25.00	2023-03-06	2023-03-07	199.99
307	5	149.99	0.00	25.00	2023-03-17	2023-03-20	524.97
302	6	174.99	10.00	0.00	2023-03-18	2023-03-23	924.95
202	7	174.99	10.00	0.00	2023-03-29	2023-03-31	349.98
301	9	174.99	10.00	25.00	2023-04-09	2023-04-13	759.96
207	10	149.99	0.00	25.00	2023-04-23	2023-04-24	174.99
401	11	399.99	20.00	0.00	2023-05-30	2023-06-02	1139.97
206	12	149.99	0.00	0.00	2023-06-10	2023-06-14	599.96
208	13	149.99	0.00	0.00	2023-06-10	2023-06-14	599.96
304	14	174.99	10.00	0.00	2023-06-17	2023-06-18	184.99
205	15	149.99	0.00	25.00	2023-06-28	2023-07-02	699.96
204	16	174.99	10.00	0.00	2023-07-13	2023-07-14	184.99
401	17	399.99	20.00	0.00	2023-07-18	2023-07-21	1259.97
303	18	174.99	10.00	25.00	2023-07-28	2023-07-29	199.99
307	19	149.99	0.00	25.00	2023-08-30	2023-09-01	349.98
208	20	149.99	0.00	0.00	2023-09-16	2023-09-17	149.99
203	21	174.99	10.00	25.00	2023-09-13	2023-09-15	399.98
401	22	399.99	20.00	0.00	2023-11-22	2023-11-25	1139.97
206	23	149.99	0.00	0.00	2023-11-22	2023-11-25	449.97
301	24	174.99	10.00	25.00	2023-11-22	2023-11-25	599.97
302	25	174.99	10.00	0.00	2023-12-24	2023-12-28	699.96*/
-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
select room.roomNumber, r.startDate, r.endDate, t.maximumOccupancy
	from reservation r
    join roomReservation on r.reservationID = roomReservation.reservationID
    join room on room.roomID = roomReservation.roomID
    join type t on t.typeID = room.typeID
    where t.maximumOccupancy>=3 and (r.startDate like "2023-04%" or r.endDate like "2023-04%");
-- 301	2023-04-09	2023-04-13	4
-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
select g.firstName, g.lastName, count(r.guestID) numReservations
	from guest g
    left outer join reservation r on r.guestID = g.guestID
    group by g.lastName
    order by numReservations DESC, g.lastName;
    --  i don't think the left outer join is necessary since every guest has at least one reservation, but in theory this would include guests in the system who have none if they existed.
/*Mack	Simmer	4
BettyAnn	Seery	3
Duane	Cullison	2
Dale	Dybvig	2
Walter	Holloway	2
Aurore	Lipton	2
Maritza	Tilton	2
Jolene	Tison	2
Wilfred	Vise	2
Karie	Yang	2
Zachery	Luechtefeld	1*/
-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
select g.firstName, g.lastName, g.streetaddress, g.city, g.state, g.zip, g.phone
	from guest g
    where g.phone = "444-444-4444";
-- Dale	Dybvig	44 44th Ave. S.	Minneapolis	MN	55407	444-444-4444