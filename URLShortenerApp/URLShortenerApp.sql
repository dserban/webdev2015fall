CREATE TABLE pointers (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  cryptic_id VARCHAR(20) NOT NULL,
  url TEXT NOT NULL
);
CREATE UNIQUE INDEX unique_index_on_cryptic_id ON pointers (cryptic_id);
CREATE UNIQUE INDEX unique_index_on_url        ON pointers (url);

INSERT INTO pointers VALUES(NULL, 'dcba1c', 'http://rubyonrails.org/');
INSERT INTO pointers VALUES(NULL, 'ee07d9', 'http://en.wikipedia.org/wiki/Ruby_on_Rails');
INSERT INTO pointers VALUES(NULL, 'b247ac', 'https://github.com/rails/rails');
INSERT INTO pointers VALUES(NULL, 'cf62a3', 'http://stackoverflow.com/');
INSERT INTO pointers VALUES(NULL, 'e80cb3', 'http://fmi.unibuc.ro/');
INSERT INTO pointers VALUES(NULL, 'af6de7', 'https://www.facebook.com/');
INSERT INTO pointers VALUES(NULL, 'e4053f', 'https://twitter.com/');

