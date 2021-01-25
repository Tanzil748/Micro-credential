/*
1.Videos table. Create one table to keep track of the videos. 
This table should include a unique ID, the title of the video, the length in minutes, 
and the URL. Populate the table with at least three related videos from YouTube or 
other publicly available resources
*/
create table videos(
	unique_id integer not null,
	video_title varchar(75) not null,
	minute_length integer not null,
	url varchar(200) not null,
	constraint youtube_video primary key(unique_id)
);

insert into videos values(100,'Mark Cuban makes an offer with a very short lifespan',4, 'https://www.youtube.com/watch?v=j3d4-Xo-AzE&ab_channel=ABC');
insert into videos values(101,'Alex Rodriguez Makes an Offer Contingent on Not Listening to Mark Cuban Offer', 4, 'https://www.youtube.com/watch?v=L9RYGulOg9o&ab_channel=ABC');
insert into videos values(102,'Can Bubbly Blaster Snag Two Big Sharks?',4, 'https://www.youtube.com/watch?v=_aIbHJMMU_o&ab_channel=ABC');

select * from videos

/*
2. Create and populate Reviewers table. Create a second table that provides at least two user
reviews for each of at least two of the videos. These should be imaginary reviews that include
columns for the user’s name (“Asher”, “John”, etc.), the rating (which could be NULL, or a 
number between 0 and 5), and a short text review (“Loved it!”). There should be a column that 
links back to the ID column in the table of videos.
*/
 create table reviewers(
	 r_unique_id integer not null,
	 unique_id integer not null,
	 first_name varchar(30) not null,
	 last_name varchar(30) not null,
	 rating integer not null,
	 text_review varchar(75),
	 constraint video_reviewer primary key(r_unique_id),
	 constraint foreign_key primary key(unique_id) references videos(unique_id)
	 
 );
 
insert into reviewers values(103,'Tanzil','Hassan','Loved it!',100);
insert into reviewers values(104,'John','Smith','Awesome negotiation',101);
insert into reviewers values(105,'Bob','Jenkes','Cant believe that',102);
insert into reviewers values(106,'Jamal','Akbar','Very hard to watch and unpleasant',101);
insert into reviewers values(107,'Mahin','Hossain','Entertaining',100);

select * from reviewers

/*
3.Report on Video Reviews. Write a JOIN statement that shows information from both tables.
*/
select v.video_title, v.minute_length, v.url, r.first_name, r.last_name, r.text_review, r.rating from videos v
join reviewers r
on r.unique_id = v.unique_id