drop database DaleDybvigHotelDB;
create database if not exists DaleDybvigHotelDB;

use DaleDybvigHotelDB;
create table if not exists guest(
	guestID int not null auto_increment,
    firstName varchar(30) not null,
    lastName varchar(30) not null,
    streetAddress varchar(60) not null,
    city varchar(30) not null,
    state char(2) not null,
    zip char(5) not null,
    phone varchar(14) not null,
    primary key(guestID)
);
create table if not exists reservation(
	reservationID int not null auto_increment,
    numAdults int not null,
    numChildren int not null,
    startDate date not null,
    endDate date not null,
    guestID int not null,
    foreign key fk_guestID (guestID) references guest(guestID),
    primary key(reservationID)
);
create table if not exists type(
	typeID int not null auto_increment,
    typeName varchar(10) not null,
    basePrice decimal(6,2) not null,
    pricePerExtraPerson decimal(4,2) null,
    standardOccupancy int not null,
    maximumOccupancy int not null,
    primary key(typeID)
);
create table if not exists room(
	roomID int not null auto_increment,
    roomNumber int not null,
    isAdaAccessible bool not null,
    typeID int not null,
    foreign key fk_typeID (typeID) references type(typeID),
    primary key(roomID)
);
create table if not exists amenities(
	amenityID int not null auto_increment,
    amenityName varchar(30) not null,
    amenityPrice decimal(5,2) null,
    primary key(amenityID)
);
create table if not exists roomReservation(
	roomID int not null,
    reservationID int not null,
    primary key pk_roomReservation (roomID, reservationID),
    foreign key fk_roomReservation_room (roomID) references room(roomID),
    foreign key fk_roomReservation_reservation (reservationID) references reservation(reservationID)
);
create table if not exists roomAmenities(
	roomID int not null,
    amenityID int not null,
    primary key pk_roomAmenities (roomID, amenityID),
    foreign key fk_roomAmenities_room (roomID) references room(roomID),
    foreign key fk_roomAmenities_amenity (amenityID) references amenities(amenityID)
);
