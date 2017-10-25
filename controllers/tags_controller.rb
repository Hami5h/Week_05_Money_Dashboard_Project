require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )

get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

get '/tags/new' do
  @tags = Tag.all()
  erb (:"tags/new")
end

post '/tags' do
  @merchant = Tag.new(params)
  @merchant.save
  erb(:"tags/create")
end

get '/tags/:id/update' do
  @tags = Tag.find(params[:id])
  erb(:"tags/update")
end

post '/tags/:id/update' do
  @tags = Tag.find(params[:id])
  Tag.new(params).update
  redirect to("/tags")
end

post '/tags/:id/delete' do
  @tags = Tag.find(params[:id])
  @tags.delete
  redirect to("/tags")
end
