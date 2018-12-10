PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Paul', 'van Duyn'),
  ('Robinson', 'Rosado'),
  ('Danny', 'Xu'),
  ('John', 'Kim');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Woodchucks', 'How much wood could a woodchuck chuck?', 1),
  ('Licks', 'How many licks to the center of a tootsie pop?', 1),
  ('Default', 'Did we?', 2),
  ('FF6', '...?', 3),
  ('I don''t know', '...anything about SQL...', 2);

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 1),
  (2, 1),
  (1, 2),
  (2, 2),
  (3, 2),
  (3, 1),
  (4, 3),
  (4, 1),
  (4, 4),
  (5, 4),
  (5, 3);

INSERT INTO
  replies (question_id, parent_reply_id, user_id, body)
VALUES
  (1, NULL, 2, 'f1srt!!!!11!'),
  (1, 1, 1, 'That is unprofessional'),
  (2, NULL, 4, 'Why do you have so many questions not about SQL?'),
  (3, NULL, 3, 'I''m pretty sure we did, yeah'),
  (4, NULL, 3, '...\n...\n...!'),
  (5, NULL, 2, 'Who wrote this it is not a question'),
  (5, 6, 1, 'You did!!!!'),
  (5, 7, 2, 'wat'),
  (5, 6, 3, 'Not me...');

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (2, 3),
  (2, 4),
  (3, 3),
  (3, 4),
  (3, 1),
  (4, 4),
  (4, 1),
  (4, 3);
