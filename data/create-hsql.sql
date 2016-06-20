CREATE TABLE answers
(
    answer_id INT PRIMARY KEY NOT NULL IDENTITY,
    information VARCHAR(128),
    question_id INT NOT NULL,
    user_id INT NOT NULL,
    date DATE
);
CREATE TABLE category
(
    category_id INT PRIMARY KEY NOT NULL IDENTITY,
    name VARCHAR(45) NOT NULL
);
CREATE TABLE credentials
(
    user_id INT NOT NULL,
    pass VARCHAR(2048)
);
CREATE TABLE questions
(
    question_id INT PRIMARY KEY NOT NULL IDENTITY,
    description VARCHAR(512) NOT NULL,
    category_id INT NOT NULL,
    user_id INT NOT NULL,
    date DATE
);
CREATE TABLE roles
(
    role_id INT PRIMARY KEY NOT NULL IDENTITY,
    role VARCHAR(128) NOT NULL
);
CREATE TABLE users
(
    user_id INT PRIMARY KEY NOT NULL IDENTITY,
    username VARCHAR(128),
    pic BLOB,
    email VARCHAR(128),
    role_id INT
);
ALTER TABLE answers ADD FOREIGN KEY (question_id) REFERENCES questions (question_id);
ALTER TABLE answers ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
CREATE INDEX fk_question ON answers (question_id);
CREATE INDEX fk_user_ans ON answers (user_id);
ALTER TABLE credentials ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
CREATE INDEX fk_user ON credentials (user_id);
ALTER TABLE questions ADD FOREIGN KEY (category_id) REFERENCES category (category_id);
ALTER TABLE questions ADD FOREIGN KEY (user_id) REFERENCES users (user_id);
CREATE INDEX fk_category ON questions (category_id);
CREATE INDEX fk_user_quest ON questions (user_id);
CREATE UNIQUE INDEX unique_role_id ON roles (role_id);
ALTER TABLE users ADD FOREIGN KEY (role_id) REFERENCES roles (role_id);
CREATE UNIQUE INDEX unique_user_id ON users (user_id);
CREATE INDEX fk_role ON users (role_id);
