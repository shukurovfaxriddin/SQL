create table baggage_check (iD bigint primary key , check_result varchar(50), created_at bigint ,
updated_at bigint , booking_id bigint , passenger_id bigint)

alter table baggage_check
add constraint FK_booking_id foreign key(booking_id) references booking(bookingid)


create table no_fly_list (ID bigint primary key , active_from date, active_to date ,
no_fly_reason varchar(255) , created_at timestamp , updated_at DATETIME DEFAULT GETDATE() , pagnr_id bigint)

alter table no_fly_list
add constraint FK_pagnr_id foreign key(pagnr_id) references passengers(ID)


create table airport (ID bigint primary key , airport_name varchar(50), country varchar(50) ,
state varchar(50) ,city varchar(50), created_at timestamp , updated_at DATETIME DEFAULT GETDATE())


create table security_check (ID bigint primary key , check_result varchar(20), comments varchar(6535) ,
created_at timestamp , updated_at DATETIME DEFAULT GETDATE() , passenger_id bigint)

alter table security_check
add constraint FK_passenger_id foreign key(passenger_id) references passengers(ID)


create table passengers (ID bigint primary key , fest_name varchar(50), last_name varchar(50) ,
date_of_birth date ,country_of_citizenship varchar(50) ,country_of_residence varchar(50) ,passport_number varchar(20),
created_at timestamp , updated_at DATETIME DEFAULT GETDATE())

create table flights (flight_id bigint primary key , departing_gate varchar(20),arriving_gate varchar(20),
created_at timestamp , updated_at DATETIME DEFAULT GETDATE(),
airfine_id bigint,departing_airport_id bigint,arriving_airport_id bigint)

alter table flights
add constraint FK_airfine_id foreign key(airfine_id) references airline(ID)

alter table flights
add constraint FK_departing_airport_id foreign key(departing_airport_id) references airport(ID)

alter table flights
add constraint FK_arriving_airport_id foreign key(arriving_airport_id) references airport(ID)


create table booking (bookingid bigint primary key , flight_id bigint,status varchar(20),booking_platform varchar(20),
created_at timestamp , updated_at DATETIME DEFAULT GETDATE(),passenger_id bigint)

alter table booking
add constraint FK_passengers_id foreign key(passenger_id) references passengers(ID)


create table baggage (ID bigint primary key , weight_in_kg decimal(4,2),
created_date timestamp , updated_date DATETIME DEFAULT GETDATE(),booking_id bigint)

alter table baggage
add constraint FK_boking_id foreign key(booking_id) references booking(bookingid)


create table flight_manitest (ID bigint primary key ,
created_at timestamp , updated_at DATETIME DEFAULT GETDATE(), booking_id bigint, flight_id bigint)

alter table flight_manitest
add constraint FK_buking_id foreign key(booking_id) references booking(bookingid)

alter table flight_manitest
add constraint FK_flight_id foreign key(flight_id) references flights(flight_id)


create table airline (ID bigint primary key ,airline_code varchar(20),airline_name varchar(20),airline_country varchar(50),
created_at timestamp , updated_at DATETIME DEFAULT GETDATE()
)
create table boarding_pass (ID bigint primary key ,qr_code varchar(6535),
created_at timestamp , updated_at DATETIME DEFAULT GETDATE(),booking_id bigint)

alter table boarding_pass
add constraint FK_boooking_id foreign key(booking_id) references booking(bookingid)


select * from baggage


