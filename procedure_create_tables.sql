DROP PROCEDURE IF EXISTS create_tables;

CREATE PROCEDURE create_tables()
language plpgsql
as $$
begin 
	create table if not exists Artists
	(
		ArtistID serial primary key,
		Artist varchar(100)
	);

	create table if not exists Genre
	(
		GenreID serial primary key,
		Genre varchar(100)
	);

	create table if not exists Tracks
	(
		TrackID serial primary key,
		Track varchar(100),
		GenreID serial references Genre(GenreID)
	);

	create table if not exists Days
	(
		DayID serial primary key,
		Day varchar(20)
	);

	create table if not exists Cities
	(
		CityID serial primary key, 
		City varchar(30)
	);

	create table if not exists Users
	(
		UserID serial primary key,
		CityID serial references Cities(CityID)
	);

create table if not exists TrackArtist
	(
		TAID serial primary key,
		TrackID serial references Tracks(TrackID),
		ArtistID serial references Artists(ArtistID)
	);

	create table if not exists Listening
	(
		ID serial primary key,
		UserID serial references Users(UserID),
		ArtistID serial references Artists(ArtistID),
		TrackID serial references Tracks(TrackID),
		DayID serial references Days(DayID),
		Time float,
		Report_date date not null
	);
end;
$$;

call create_tables();
