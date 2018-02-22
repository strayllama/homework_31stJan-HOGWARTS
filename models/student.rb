require_relative('../db/sql_runner.rb')
require_relative('house.rb'
)
class Student
attr_reader(:id, :first_name, :second_name, :house_id, :age)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students(
          first_name,
          second_name,
          house_id,
          age)
          VALUES($1, $2, $3, $4)
          RETURNING *;"
    values = [@first_name, @second_name, @house_id, @age]
    student = SqlRunner.run(sql, values)[0]
    @id = student['id'].to_i
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    house_hash = SqlRunner.run(sql, [@house_id])[0]
    house = House.new(house_hash)
    return house
  end

  def full_name()
    return "#{@first_name} #{@second_name}"
  end

# CLASS METHODS

  def Student.find_all()
    sql = "SELECT * FROM students"
    student_array = SqlRunner.run(sql)
    students = student_array.map {|student_hash| Student.new(student_hash)}
    return students
  end

  def Student.find_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student_hash = SqlRunner.run(sql, values)
    student = Student.new(student_hash.first)
    return student
  end

  def Student.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end # end CLASS STUDENT
