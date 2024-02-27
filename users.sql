create table users(
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(39)
);
insert into users (first_name, last_name, email) values
('Usuario1', 'Apellido1', 'usuario1@example.com'),
('Usuario2', 'Apellido2', 'usuario2@example.com'),
('Usuario3', 'Apellido3', 'usuario3@example.com');

create table posts(
	id serial primary key,
	creator_id int,
	title varchar(30),
	text text
);
insert into posts (creator_id, title, text) values
(1, 'Título del Post 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam porttitor erat sed fermentum consectetur'),
(2, 'Título del Post 2', 'Pellentesque iaculis mollis ornare. Donec tempus purus et est hendrerit, eu sagittis metus varius. Sed aliquet nibh a nunc tincidun'),
(1, 'Título del Post 3', 'Pellentesque rhoncus neque a lorem lobortis, id malesuada tellus convallis. Vivamus tempus quis magna ut aliquam. Phasellus interdum justo id nunc suscipit egestas. '),
(3, 'Título del Post 4', 'Nullam aliquam sodales dui, in accumsan dui efficitur a. Aenean metus ipsum, ultrices quis sapien tempor, malesuada molestie mi. Proin mattis dapibus ex eget pretium. Donec gravida eros dolor'),
(2, 'Título del Post 5', 'Curabitur at tincidunt augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse nunc magna, efficitur sed mattis vel');

create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);
insert into likes (user_id, post_id) values
(2, 1),
(3, 1),
(1, 2),
(3, 3),
(1, 4);





select * from posts

alter table posts add column creator_id int references users(id);

select posts.*, users.first_name, users.last_name, users.email 
from posts 
inner join users on posts.creator_id = users.id;


select posts.*, users.first_name, users.last_name, users.email 
from posts 
inner join likes on posts.id = likes.post_id 
inner join users on likes.user_id = users.id;

