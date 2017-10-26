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

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  erb(:"transactions/create")
end

get '/transactions/:type_id' do
  @transactions = Transaction.tag_type(params[:type_id])
  @total = Transaction.total_by_tag_type(params[:type_id])
  erb (:"transactions/filtered")
end

get '/transactions/:id/update' do
  @transactions = Transaction.find(params[:id])
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:"transactions/update")
end

post '/transactions/:id/update' do
  @transactions = Transaction.find(params[:id])
  @tags = Tag.all()
  @merchants = Merchant.all()
  Transaction.new(params).update
  redirect to("/transactions")
end


post '/transactions/:id/delete' do
  @transactions = Transaction.find(params[:id])
  @transactions.delete
  redirect to("/transactions")
end
