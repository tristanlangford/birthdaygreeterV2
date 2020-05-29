require 'sinatra/base'
require 'date'
require_relative "./birthday"

class Birthday < Sinatra::Base

  enable :sessions

  get "/" do
    erb(:index)
  end

  post "/birthday" do
    session[:name] = params[:name]
    @birthday = BirthdayCalulator.new(params[:month], params[:day])
    if @birthday.birthday_today?
      redirect "/birthday"
    else
      session[:countdown] = @birthday.countdown
      redirect "/countdown"
    end
  end

  get "/birthday" do
    erb(:birthday)
  end

  get "/countdown" do
    erb(:countdown)
  end

end
