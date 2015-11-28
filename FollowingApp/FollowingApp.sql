CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  user_name VARCHAR(255)
);
CREATE INDEX index_on_user_name ON users (user_name);

CREATE TABLE follower_relationships (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  follower_id INTEGER NOT NULL,
  followed_person_id INTEGER NOT NULL
);
CREATE INDEX
  index_on_follower_id
ON
  follower_relationships (follower_id);
CREATE INDEX
  index_on_followed_person_id
ON
  follower_relationships (followed_person_id);

INSERT INTO users VALUES(NULL, 'Alice');
INSERT INTO users VALUES(NULL, 'Andy');
INSERT INTO users VALUES(NULL, 'Ashley');
INSERT INTO users VALUES(NULL, 'Betty');
INSERT INTO users VALUES(NULL, 'Billy');
INSERT INTO users VALUES(NULL, 'Bobby');
INSERT INTO users VALUES(NULL, 'Bradley');
INSERT INTO users VALUES(NULL, 'Chris');
INSERT INTO users VALUES(NULL, 'Craig');
INSERT INTO users VALUES(NULL, 'Dorothy');
INSERT INTO users VALUES(NULL, 'Emily');
INSERT INTO users VALUES(NULL, 'Gregory');
INSERT INTO users VALUES(NULL, 'Jack');
INSERT INTO users VALUES(NULL, 'Jason');
INSERT INTO users VALUES(NULL, 'Jennifer');
INSERT INTO users VALUES(NULL, 'Jessica');
INSERT INTO users VALUES(NULL, 'Linda');
INSERT INTO users VALUES(NULL, 'Maggie');
INSERT INTO users VALUES(NULL, 'Ryan');
INSERT INTO users VALUES(NULL, 'Tony');

