Hogwarts
Dumbledore has asked you to make a system for tracking student enrolments at Hogwarts.

Each student has:
A first name
A second name
A house
An age

Part 1:
Create a Hogwarts database:
% createdb hogwarts

Create a table for Students

* Create directory hogwarts/
* Create within it db/ models/ public/ views/
* Create file in db/ called "hogwarts.sql" --> here we create the table Students with the following code:
DROP TABLE students;

CREATE TABLE students (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  house varchar(255),
  age int2
);
* Run this on the database:
% pqsl -d hogwarts -f db/hogwarts.sql


Part 2
Create a ruby model that can save() a students details
* in db/ create a file called sql.runner (populate as normal)
* in models/ create a file called students.rb, make a class
  students and initalize it to take all data, and make save() and delete_all class method.
* Make use of sql runner to save to the db.

Create some seed data to populate the database with students
* in db/ create a file called seeds.rb and fill it with students
  that call the above save() method. Use delete_all() at the top of the file.

Part 3
Add methods to a student to
find all the students
* returns all the students in the table as student.objects
  find a student by id, as standard class methods..


Part 4
Create a view to show all the students
* First in views/ make a 'layout.erb' and put full html page, in main
  have <% yield %> as a place holder
* In views/ make 'index.erb' and put html+ruby code to take an array of students
  and display in a table.
* make a in / make 'controller.rb' require sinatra etc. make a make a
  get to erb to :index, with code @students = Student.find_all()

Part 5
Create a view to create a new student
hard code a drop down of house names
* Create in view/ 'new.erb'
* This is a form with all the inputs, method = post, labels and inputs
* in controller.rb create a get '/hogwarts/new' that erb(:new) to get to the form
  and post 'hogwarts-students' that creates a Student.new(params)
  and then student.save() to add to database
  erb(:confirmation) if you like

Part 6
A house can be one of Gryffindor, Ravenclaw, Hufflepuff, or Slytherin and should be stored in the database with:
  A name
  Optionally, a url for a logo

Create a table for Houses
DONE

Create a ruby model that can save() the details of a house
DONE

Seed the database
DONE

Part 7
Add a method to House to find all houses
Add a method to House to find a house by id
DONE

Part 8
Alter the student to have a foreign key to House instead of text
Add a method to Student to find a house() for the student
DONE

Part 9
Change the new student form to populate the drop down from the House table
* eeerm
