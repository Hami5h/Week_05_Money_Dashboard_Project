require_relative( '../db/sql_runner' )

class Transaction

  attr_reader(:amount, :merchant_id, :tag_id, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (amount, merchant_id, tag_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |transaction| Transaction.new(transaction) }
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results.first)
  end

  def self.total()
    sql = "SELECT SUM(amount) as sum FROM transactions"
    values = []
    results = SqlRunner.run(sql, values)
    return results.first["sum"].to_i
  end

end
