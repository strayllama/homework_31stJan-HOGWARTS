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

  def House.find_all()
    sql = "SELECT * FROM houses"
    house_array = SqlRunner.run(sql)
    houses = house_array.map {|house_hash| House.new(house_hash)}
    return houses
  end

  def House.find_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [$1]
    house_hash = SqlRunner.run(sql, values)[0]
    house = Student.new(house_hash)
    return house
  end

  def House.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end # end CLASS HOUSE
