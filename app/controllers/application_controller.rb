
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

#create-new-form
  get '/articles/new' do
    erb :new
  end

#create-create-save
  post '/articles' do
    Article.create (params)
    #article.save
    redirect to "/articles/#{Article.last.id}"
  end

#read-index
  get '/articles' do
    @articles=Article.all
    erb :index
  end

#read-show
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

#update-update form
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

#update-passes from edit form to params-redirects to updated object
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

#delete
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
