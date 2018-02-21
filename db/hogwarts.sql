DROP TABLE students;
DROP TABLE houses;

CREATE TABLE houses (
  id serial4 primary key,
  name varchar(255),
  logo_url varchar(255)
);

CREATE TABLE students (
  id serial4 primary key,
  first_name varchar(255),
  second_name varchar(255),
  house varchar(255),
  age int2
);
-- CREATE TABLE students (
--   id serial4 primary key,
--   first_name varchar(255),
--   second_name varchar(255),
--   house_id INT$ REFERENCES houses(id),
--   age int2
-- );
