-- Create Database
CREATE DATABASE IF NOT EXISTS blog;
USE blog;

-- USERS TABLE
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- POSTS TABLE
CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- COMMENTS TABLE
CREATE TABLE comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment TEXT,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data into users
INSERT INTO users(email, password) VALUES ('sweetcandi@gmail.com', 'ah zome');

-- Insert sample data into posts
INSERT INTO posts(title, content, user_id) VALUES ('First post', 'This is the content of the first post.', 1);

-- Insert sample data into comments
INSERT INTO comments(comment, user_id, post_id) VALUES ('This is a comment on the first post.', 1, 1);

-- Get all posts with user and comment information
SELECT 
    users.id AS user_id,
    users.email AS user_email,
    posts.id AS post_id,
    posts.title AS post_title,
    comments.id AS comment_id,
    comments.comment AS comment
FROM users 
JOIN posts ON users.id = posts.user_id
JOIN comments ON posts.id = comments.post_id
WHERE users.id = 1;
