require_relative( '../db/sql_runner' )

class Transacation

  attr_reader(:name, :amount, :merchant_id, :tag_id, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag-id'].to_i
  end

end
