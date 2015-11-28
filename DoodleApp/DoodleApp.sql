CREATE TABLE options (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  option_name TEXT NOT NULL
);

CREATE TABLE participants (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  participant_name TEXT NOT NULL
);

CREATE TABLE actual_choices (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  participant_id INTEGER NOT NULL,
  option_id      INTEGER NOT NULL
);
CREATE INDEX index_on_participant_id ON actual_choices (participant_id);
CREATE INDEX index_on_option_id      ON actual_choices (option_id);

INSERT INTO options VALUES(NULL, 'Java');
INSERT INTO options VALUES(NULL, 'C');
INSERT INTO options VALUES(NULL, 'Python');
INSERT INTO options VALUES(NULL, 'C++');
INSERT INTO options VALUES(NULL, 'Ruby');
INSERT INTO options VALUES(NULL, 'Haskell');
INSERT INTO options VALUES(NULL, 'PHP');

INSERT INTO participants VALUES(NULL, 'James');
INSERT INTO participants VALUES(NULL, 'Guido');
INSERT INTO participants VALUES(NULL, 'Bjarne');
INSERT INTO participants VALUES(NULL, 'Simon');
INSERT INTO participants VALUES(NULL, 'Hansson');

INSERT INTO actual_choices VALUES(NULL, 1, 1);
INSERT INTO actual_choices VALUES(NULL, 2, 2);
INSERT INTO actual_choices VALUES(NULL, 2, 3);
INSERT INTO actual_choices VALUES(NULL, 2, 6);
INSERT INTO actual_choices VALUES(NULL, 3, 2);
INSERT INTO actual_choices VALUES(NULL, 3, 4);
INSERT INTO actual_choices VALUES(NULL, 4, 2);
INSERT INTO actual_choices VALUES(NULL, 4, 3);
INSERT INTO actual_choices VALUES(NULL, 4, 6);
INSERT INTO actual_choices VALUES(NULL, 5, 2);
INSERT INTO actual_choices VALUES(NULL, 5, 3);
INSERT INTO actual_choices VALUES(NULL, 5, 5);

