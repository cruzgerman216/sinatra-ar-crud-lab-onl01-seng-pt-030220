
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :"../views/new"
  end

  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :"../views/index"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :"../views/show"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"../views/update"
  end

  patch '/articles/:id' do 
    article = Article.find(params[:id])
    article.update(params)
    redirect "/articles/#{id}"
  end
end
