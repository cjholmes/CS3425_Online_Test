CREATE TABLE users (
  username VARCHAR(30) PRIMARY KEY,
  password VARCHAR(30),
  teacher BOOLEAN
);

CREATE TABLE student (
  username VARCHAR(30) PRIMARY KEY,
  id INT,
  name VARCHAR(50),
  major VARCHAR(50),
  FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE grades(
  username VARCHAR(30) PRIMARY KEY,
  exam INT,
  grade DOUBLE,
  correct INT,
  FOREIGN KEY (username) REFERENCES users(username),
  FOREIGN KEY (exam) REFERENCES exams(id)
);

CREATE TABLE exams (
  id INT PRIMARY KEY,
  name VARCHAR(30),
  total INT
);

CREATE TABLE questions (
  id INT PRIMARY KEY,
  exam INT,
  question VARCHAR(144),
  num_options INT,
  value INT,
  FOREIGN KEY (exam) REFERENCES exams(id)
);

CREATE TABLE options (
  id INT PRIMARY KEY,
  question INT,
  text VARCHAR(144),
  correct BOOLEAN,
  FOREIGN KEY (question) REFERENCES questions(id)
);

