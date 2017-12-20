CREATE TABLE users (
  username VARCHAR(30) PRIMARY KEY,
  password VARCHAR(64),
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
  data TEXT,
  FOREIGN KEY (username) REFERENCES users(username),
  FOREIGN KEY (exam) REFERENCES exams(id)
);

CREATE TABLE exams (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30),
  total INT
);

CREATE TABLE questions (
  questionnumber INT,
  examname VARCHAR(30) REFERENCES exams(name),
  question TEXT,
  num_options INT,
  pointVal INT
);

CREATE TABLE options (
  id INT PRIMARY KEY AUTO_INCREMENT,
  examname VARCHAR(30) NOT NULL REFERENCES exams(name),
  questionnum INT NOT NULL REFERENCES questions(questionnumber),
  text TEXT,
  correct BOOLEAN
);

CREATE PROCEDURE newStudent(IN usern VARCHAR(30), IN pass VARCHAR(64),
  IN idnum INT, IN nam VARCHAR(50), IN maj VARCHAR(50))
  BEGIN
      INSERT INTO users VALUE (usern, pass, FALSE );
      INSERT INTO student VALUES (usern, idnum, nam, maj);
  END//

CREATE PROCEDURE newExam (IN title VARCHAR(30), IN totalPoints INT)
  BEGIN
    INSERT INTO exams(name, total) VALUES (title, totalPoints);
  END//

CREATE PROCEDURE newQuestion(IN examName VARCHAR(30), IN questionNum INT,
  IN questionText TEXT, IN numOptions INT, IN qval INT)
  BEGIN
    INSERT INTO questions VALUES (questionNum, examName, questionText, numOptions, qval);
  END//

CREATE PROCEDURE newOption(IN examName VARCHAR(30), IN questionNum INT, IN oText TEXT,
  IN cor INT)
  BEGIN
    INSERT INTO options(examname, questionnum, text, correct) VALUES (examName, questionNum,
    oText, cor);
  END//
