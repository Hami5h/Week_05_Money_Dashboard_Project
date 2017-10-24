require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/tag.rb' )
require_relative( '../models/transaction.rb' )
#require('pry-byebug')

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  erb ( :"transactions/index" )
end

get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb (:"transactions/new")
end

get '/transactions/:type' do
  @transactions = Transaction.tag_type(params[:type])
  @total = Transaction.total_by_tag_type(params[:type])
  erb (:"transactions/index")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  erb(:"transactions/create")
end
