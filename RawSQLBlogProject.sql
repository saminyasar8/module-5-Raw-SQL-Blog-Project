CREATE DATABASE blog;

USE blog;
--USERS TABLE
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,


);

--post table
CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) NOT DELETE CASCADE,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

);
--COMMENTS table
CREATE TABLE comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment TEXT null,
    
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) NOT DELETE CASCADE,
    FOREIGN KEY (posts_id) REFERENCES posts(id) NOT DELETE CASCADE,
    created_at TIMESTAMP  DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

);

--INsert sample data into users
INSERT INTO users(email,password) VALUES ('sweetcandi@gmail.com', "ah zome");
--INsert sample data into post
INSERT INTO posts(title, content, user_id) VALUES ('Firsts post','This is the content of the first post. ', 1);
--INsert sample data into comments
INSERT INTO comments(comment, user_id, post_id) VALUES ('This is a comment on the first post. ', 1,1);

--Get all posts with user information
SELECT user, id AS user_id, user.email AS user_email, 
        post.id AS post_id, post.title AS post_title,
        comment.id AS comment_id, comment.comment AS comment

from users AS users 
JOIN posts AS post ON user.id = post.user_id
JOIN comments AS comment ON user.id = comment.post_id
WHERE user.id =1;


