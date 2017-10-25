require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant.rb')

get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get '/merchants/new' do
  @merchants = Merchant.all()
  erb (:"merchants/new")
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:"merchants/create")
end

get '/merchants/:id/update' do
  @merchants = Merchant.find(params[:id])
  erb(:"merchants/update")
end

post '/merchants/:id/update' do
  @merchants = Merchant.find(params[:id])
  Merchant.new(params).update
  redirect to("/merchants")
end

post '/merchants/:id/delete' do
  @merchants = Merchant.find(params[:id])
  @merchants.delete
  redirect to("/merchants")
end
