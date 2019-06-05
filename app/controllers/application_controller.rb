
require_relative '../../config/environment'
require "pry"
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
   erb :home
  end

get '/articles' do
   @articles = Article.all
   # binding.pry
   erb :index
end

get '/articles/new' do
   erb :new
end

post '/articles' do
   @article = Article.create(title: params[:title], content: params[:content])
   redirect to "/articles/#{@article.id}"
end

get '/articles/:id' do
   @article = Article.find(params[:id])
   erb :show
end

get '/articles/:id/edit' do
   @article = Article.find(params[:id])
   erb :edit
end

patch '/articles/:id' do
   @article = Article.find(params[:id])
   @article.update(title: params[:title], content: params[:content])
   redirect to "/articles/#{@article.id}"
end

get '/articles/:id/delete' do
   @article = Article.find(params[:id])
   erb :delete
end

delete '/articles/:id/delete' do
   @article = Article.find(params[:id])
   @article.delete
   redirect to '/articles'
end


end
