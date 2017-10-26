require_relative('../db/sql_runner')

class Transaction

  attr_reader(:id)
  attr_accessor(:amount, :item_name, :merchant_id, :tag_id, :budget)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @item_name = options['item_name']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @budget = 3000
  end

  def save()
    sql = "INSERT INTO transactions
    (amount, item_name, merchant_id, tag_id)
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@amount, @item_name, @merchant_id, @tag_id]
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
    sql = "SELECT SUM(amount) FROM transactions"
    values = []
    results = SqlRunner.run(sql, values)
    return results.first["sum"].to_i
  end

  # def self.total_by_tag_type(type)
  #   sql = "SELECT SUM(transactions.amount)
  #   FROM transactions
  #   INNER JOIN tags
  #   ON transactions.tag_id = tags.id
  #   WHERE item_type = $1"
  #   values = [type.capitalize]
  #   results = SqlRunner.run(sql, values)
  #   return results.first["sum"]

  # end

  def self.total_by_tag_type(id)
    sql = "SELECT SUM(amount)
    FROM transactions
    WHERE tag_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.first["sum"].to_i
  end

  # def self.total_by_tag_name(name)
  #   sql = "SELECT SUM(transactions.amount)
  #   FROM tags
  #   INNER JOIN transactions
  #   ON transactions.tag_id = tags.id
  #   WHERE name = $1"
  #   values = [name.capitalize]
  #   results = SqlRunner.run(sql, values)
  #   return results.first["sum"]
  # end

  def self.total_by_merchant(id)
    sql = "SELECT sum(amount)
    FROM transactions
    WHERE merchant_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.first["sum"].to_i
  end

#   THE CODE BELOW WORKS BUT HAS BEEN REFARCTORED AS ABOVE
  # def self.total_by_merchant(name)
  #   sql = "SELECT SUM(transactions.amount)
  #   FROM merchants
  #   INNER JOIN transactions
  #   ON transactions.merchant_id = merchants.id
  #   WHERE name = $1"
  #   values = [name.capitalize]
  #   results = SqlRunner.run(sql, values)
  #   return results.first["sum"]
  # end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    results = SqlRunner.run( sql, values )
    return Merchant.new( results.first )
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    results = SqlRunner.run( sql, values )
    return Tag.new( results.first )
  end

  def self.tag_type(id)
    sql = "SELECT *
    FROM transactions
    WHERE tag_id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results.map { |transaction| Transaction.new(transaction) }
  end
  #
  #
  #   sql = "SELECT transactions.*
  #   FROM transactions
  #   INNER JOIN tags
  #   ON transactions.tag_id = tags.id
  #   WHERE item_type = $1"
  #   values = [type.capitalize]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |transaction| Transaction.new(transaction) }
  # end

  def update()
    sql = "UPDATE transactions
    SET (amount, item_name, merchant_id, tag_id) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@amount, @item_name, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.reduce_total()
    sql = "SELECT * FROM transactions"
    values = []
    transactions = SqlRunner.run( sql, values )
    return transactions.reduce(0) { |sum, transaction| sum + transaction['amount'].to_i }
  end

  def self.budget_limit()
    return 3000 - Transaction.total()
  end

end
