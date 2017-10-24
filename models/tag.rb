require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:name, :type, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO tags
    (name, type)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@name, @type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |tag| Tag.new(tag) }
  end

end
