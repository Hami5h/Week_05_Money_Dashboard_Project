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

end
