require_relative( '../db/sql_runner' )

class Tag

  attr_reader(:item_type, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @item_type = options['item_type']
  end

  def save()
    sql = "INSERT INTO tags
    (item_type)
    VALUES
    ($1)
    RETURNING id"
    values = [@item_type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    values = []
    results = SqlRunner.run( sql, values )
    return results.map { |tag| Tag.new(tag) }
  end

  def self.find(id)
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def update()
    sql = "UPDATE tags
    SET (item_type) = ($1)
    WHERE ID = $2"
    values = [@item_type, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM tags
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    values = []
    SqlRunner.run(sql, values)
  end

end
