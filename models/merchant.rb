require_relative( '../db/sql_runner' )

class Merchant

  attr_reader(:name, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |merchant| Merchant.new(merchant) }
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results.first)
  end

  def update()
    sql = "UPDATE merchants
    SET (name) = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    values = []
    SqlRunner.run(sql, values)
  end

#   THE CODE BELOW WORKS BUT IS REDUNDANT SINCE IT IS ALSO WITHIN THE TRANSACTIONS METHOD.
  # def self.total_spent(id)
  #   sql = "SELECT SUM(amount)
  #   FROM transactions
  #   WHERE merchant_id = $1"
  #   values = [id]
  #   results = SqlRunner.run(sql, values)
  #   return results.first["sum"]
  # end

end
