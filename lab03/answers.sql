-- Exercise 1 (done for you):
SELECT * FROM users;



-- Exercise 2 (done for you):
SELECT id, first_name, last_name 
FROM users;



-- Exercise 3
SELECT id, first_name, last_name
FROM users
ORDER BY last_name;


-- Exercise 4
SELECT id, image_url, user_id
FROM posts
WHERE user_id=26;


-- Exercise 5
SELECT id, image_url, user_id
FROM posts
WHERE user_id=26 or user_id=12;


-- Exercise 6
SELECT count(*)
FROM posts;


-- Exercise 7
SELECT user_id, count(*) count
FROM comments
group by user_id
order by count desc;


-- Exercise 8
SELECT posts.id, posts.image_url, posts.user_id, users.username, users.first_name, users.last_name
FROM posts inner join users on posts.user_id = users.id
WHERE user_id=26 or user_id=12;


-- Exercise 9
select posts.id, posts.pub_date, following.following_id
from posts inner join following on posts.user_id = following.following_id
where following.user_id = 26;


-- Exercise 10
select posts.id, posts.pub_date, following.following_id, users.username
from posts inner join following on posts.user_id = following.following_id inner join users on posts.user_id = users.id
where following.user_id = 26
order by posts.pub_date desc;


-- Exercise 11
insert into bookmarks(user_id, post_id, timestamp)
values (26, 219, now())
insert into bookmarks(user_id, post_id, timestamp)
values (26, 220, now())
insert into bookmarks(user_id, post_id, timestamp)
values (26, 221, now())


-- Exercise 12
delete from bookmarks
where user_id = 26 and post_id = 219
delete from bookmarks
where user_id = 26 and post_id = 220
delete from bookmarks
where user_id = 26 and post_id = 221


-- Exercise 1update users
set email = 'knick2022@gmail.com'
where id = 26;


-- Exercise 14
select distinct posts.id, posts.user_id, b.count as count, posts.caption
from posts inner join (select post_id, count(*) as count 
			   from comments
			   group by post_id) b
			   on posts.id = b.post_id
where posts.user_id = 26
order by b.count desc

