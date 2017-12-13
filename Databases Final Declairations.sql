CREATE TABLE users (
  username VARCHAR(30) PRIMARY KEY,
  password VARCHAR(30),
  name VARCHAR(50),
  teacher BOOLEAN
);

CREATE TABLE grades(
  username VARCHAR(30),
  grade INT,
  test INT,
  FOREIGN KEY (username) REFERENCES users(username),
  FOREIGN KEY (test) REFERENCES tests(id)
);

CREATE TABLE tests (
  admin VARCHAR(30),
  id INT PRIMARY KEY,
  name VARCHAR(30),
  type VARCHAR(4),
  total INT,
  FOREIGN KEY (admin) REFERENCES users(username)
);

CREATE TABLE questions (
  quiz INT,
  id INT PRIMARY KEY,
  question VARCHAR(144),
  num_options INT,
  value INT,
  FOREIGN KEY (quiz) REFERENCES tests(id)
);

CREATE TABLE options (
  id INT PRIMARY KEY,
  text VARCHAR(144),
  right BOOLEAN,
  FOREIGN KEY (id) REFERENCES questions(id)
);

