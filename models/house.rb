require_relative('../db/sql_runner.rb')

class House
attr_reader(:id, :name, :logo_url)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo_url = options['logo_url']
  end

  def save()
    sql = "INSERT INTO houses(
          name,
          logo_url)
          VALUES($1, $2)
          RETURNING *;"
    values = [@name, @logo_url]
    house = SqlRunner.run(sql, values)[0]
    @id = house['id'].to_i
  end

# CLASS METHODS

  # def Student.find_all()
  #   sql = "SELECT * FROM students"
  #   student_array = SqlRunner.run(sql)
  #   students = student_array.map {|student_hash| Student.new(student_hash)}
  #   return students
  # end
  #
  # def Student.find_id(id)
  #   sql = "SELECT * FROM students WHERE id = $1"
  #   values = [$1]
  #   student_hash = SqlRunner.run(sql, values)[0]
  #   student = Student.new(student_hash)
  #   return student
  # end

  def House.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end # end CLASS HOUSE
