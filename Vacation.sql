drop database if exists Vacation;
create database Vacation;
use Vacation;

create table if not exists Activity(
ActivityName varchar(100) not null,
NumPlayers int not null,
Primary Key (ActivityName)
);

insert into Activity (ActivityName, NumPlayers) values ("Hiking", 1);
insert into Activity (ActivityName, NumPlayers) values ("Mountain Biking", 2);
insert into Activity (ActivityName, NumPlayers) values ("Soccer", 22);
insert into Activity (ActivityName, NumPlayers) values ("Baseball", 18);
insert into Activity (ActivityName, NumPlayers) values ("Roller Skating", 1);
insert into Activity (ActivityName, NumPlayers) values ("Yoga", 1);
insert into Activity (ActivityName, NumPlayers) values ("Beach Volleyball", 6);
insert into Activity (ActivityName, NumPlayers) values ("Surfing", 1);
insert into Activity (ActivityName, NumPlayers) values ("Boogeyboarding", 1);
insert into Activity (ActivityName, NumPlayers) values ("Tennis", 2);
insert into Activity (ActivityName, NumPlayers) values ("Badminton", 4);
insert into Activity (ActivityName, NumPlayers) values ("Swimming", 1);
insert into Activity (ActivityName, NumPlayers) values ("Catch", 2);
insert into Activity (ActivityName, NumPlayers) values ("Bocce", 4);
insert into Activity (ActivityName, NumPlayers) values ("Croquet", 4);
insert into Activity (ActivityName, NumPlayers) values ("Cycling", 1);
insert into Activity (ActivityName, NumPlayers) values ("BBQ", 8);
insert into Activity (ActivityName, NumPlayers) values ("Tanning", 1);
insert into Activity (ActivityName, NumPlayers) values ("Camping", 2);
insert into Activity (ActivityName, NumPlayers) values ("Kayaking", 2);
insert into Activity (ActivityName, NumPlayers) values ("Paddle Boarding", 1);

create table if not exists Park(
ParkName varchar(200),
Address varchar(200),
State varchar(2),
ZipCode varchar(6),
Primary Key (ParkName)
);

 insert into Park (ParkName, Address, State, ZipCode) values ("Wells Beach", "Mile Road", "ME", "43786");
insert into Park (ParkName, Address, State, ZipCode) values ("Winikini Castle", "Haverhill", "MA", "03867");
insert into Park (ParkName, Address, State, ZipCode) values ("Maudsley", "NewburyPort", "MA", "123456");
 insert into Park (ParkName, Address, State, ZipCode) values ("Bradley Palmer", "Topsfield", "MA", "43726");
insert into Park (ParkName, Address, State, ZipCode) values ("Jigger Johnson", "Albany", "NH","038541");
insert into Park (ParkName, Address, State, ZipCode) values ("Pawtuckaway", "Nottingham", "NH", "03290");
insert into Park (ParkName, Address, State, ZipCode) values ("Bear Brook", "Allenstiown", "NH", "03287");
insert into Park (ParkName, Address, State, ZipCode) values ("Gilette Stadium", "Foxboro", "MA", "04842");
insert into Park (ParkName, Address, State, ZipCode) values ("Fenway Park", "Boston", "MA", "53856");
insert into Park (ParkName, Address, State, ZipCode) values ("Canobie Lake", "Salem", "NH", "12345");
insert into Park (ParkName, Address, State, ZipCode) values ("Six Flags", "Aggawam", "MA", "56778");


create table if not exists Plan(
Id int auto_increment not null,
ActivityName varchar(100),
ParkName varchar(200),
Primary Key (Id),
Foreign Key (ActivityName) references  Activity (ActivityName) on update cascade on delete cascade,
Foreign Key (ParkName) references  Park (Parkname) on update cascade on delete cascade
);

insert into Plan (ActivityName, ParkName) values ("Hiking", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Mountain Biking", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Camping", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Kayaking", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Paddle Boarding", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("BBQ", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Swimming", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Roller Skating", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Yoga", "Bear Brook");
insert into Plan (ActivityName, ParkName) values ("Catch", "Bear Brook");

insert into Plan (ActivityName, ParkName) values ("Hiking", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Mountain Biking", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Camping", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Kayaking", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Paddle Boarding", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("BBQ", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Swimming", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Roller Skating", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Yoga", "Pawtuckaway");
insert into Plan (ActivityName, ParkName) values ("Catch", "Pawtuckaway");

insert into Plan (ActivityName, ParkName) values ("Hiking", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("Mountain Biking", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("BBQ", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("Roller Skating", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("Yoga", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("Catch", "Winikini Castle");
insert into Plan (ActivityName, ParkName) values ("Tennis", "Winikini Castle");

insert into Plan (ActivityName, ParkName) values ("Hiking", "Maudsley");
insert into Plan (ActivityName, ParkName) values ("Mountain Biking", "Maudsley");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Maudsley");
insert into Plan (ActivityName, ParkName) values ("BBQ", "Maudsley");
insert into Plan (ActivityName, ParkName) values ("Yoga", "Maudsley");
insert into Plan (ActivityName, ParkName) values ("Catch", "Maudsley");

insert into Plan (ActivityName, ParkName) values ("Hiking", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Mountain Biking", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("BBQ", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Yoga", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Catch", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Bocce", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Croquet", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Tennis", "Bradley Palmer");
insert into Plan (ActivityName, ParkName) values ("Cycling", "Bradley Palmer");

insert into Plan (ActivityName, ParkName) values ("Swimming", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Kayaking", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Yoga", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Paddle Boarding", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Surfing", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Boogeyboarding", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Beach Volleyball", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Catch", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Bocce", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Badminton", "Wells Beach");
insert into Plan (ActivityName, ParkName) values ("Croquet", "Wells Beach");


insert into Plan (ActivityName, ParkName) values ("Camping", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Swimming", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Catch", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Bocce", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Badminton", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Roller Skating", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Cycling", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("BBQ", "Jigger Johnson");
insert into Plan (ActivityName, ParkName) values ("Tanning", "Jigger Johnson");

insert into Plan (ActivityName, ParkName) values ("Soccer", "Gilette Stadium");

insert into Plan (ActivityName, ParkName) values ("Baseball", "Fenway Park");
insert into Plan (ActivityName, ParkName) values ("Catch", "Fenway Park");


DELIMITER //
CREATE PROCEDURE AddPark(IN p_parkName VARCHAR(200), IN p_address VARCHAR(200), IN p_state VARCHAR(2), IN p_zipCode VARCHAR(6))
BEGIN
    INSERT INTO Park (ParkName, Address, State, ZipCode) VALUES (p_parkName, p_address, p_state, p_zipCode);
END //
DELIMITER ;

-- Stored procedure for adding a new activity
DELIMITER //
CREATE PROCEDURE AddActivity(IN p_activityName VARCHAR(100), IN p_numPlayers INT)
BEGIN
    INSERT INTO Activity (ActivityName, NumPlayers) VALUES (p_activityName, p_numPlayers);
END //
DELIMITER ;





