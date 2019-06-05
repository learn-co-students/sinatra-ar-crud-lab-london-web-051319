
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

   get '/articles/new' do
    @article = Article.new
    erb :new
  end

   get '/articles/:id' do
    @article = Article.find params[:id]
    erb :show
  end

   post '/articles' do
    article = Article.create params
    redirect :"/articles/#{article.id}"
  end
  get '/articles/:id/edit' do
    @article = Article.find params[:id]
    erb :edit
  end

   patch '/articles/:id' do
    article = Article.find params[:id]
    article.update params.except(:_method)
    redirect "/articles/#{article.id}"
  end

   delete '/articles/:id' do
    article = Article.find params[:id]
    article.destroy
    redirect '/articles'
  end
end
