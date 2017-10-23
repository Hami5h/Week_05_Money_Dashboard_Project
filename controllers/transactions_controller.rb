require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
#require('pry-byebug')

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  @merchant = merchant.name()
  #binding.pry
  erb ( :"transactions/index" )
end
