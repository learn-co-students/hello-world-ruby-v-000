require './config/environment'

class CollegeController < ApplicationController

  get '/college' do
    if logged_in?
    @college = College.all
    erb :'college/index'
    end
  end


  get '/college/new' do
    if logged_in?
      erb :'college/new'
    else
      redirect '/login'
    end
  end



  post '/college' do
    if logged_in? && params[:id] == ""
        erb :'college/new'
      else
          @college = College.create(params[:id])
          @college.save
        redirect "/college/#{@college.id}" #This is my show.erb page
        #This redirect above is sending me to get '/college/:id do per S.'
#Redirect erases all of the data per S
      end
    end


  get '/college/:id' do
  # binding.pry
    if logged_in?
       @college = College.find_by_id(params[:id])
      erb :'/college/show'
    else
      redirect '/login'
    end
  end


  get '/college/:id/edit' do
    if logged_in?
      @college = College.find_by_id(params[:id])
      @college && @college.student == current_student
      erb :'college/edit'
    else
      redirect '/id'
      end
    end


    patch '/college/:id' do
      @college = College.find_by_id(params[:id])
      @college.name = params[:name]
      @college.region = params[:region]
      @college.save
      redirect "/college/#{@college.id}"

      # OR try plural college like this:  redirect to "/colleges/#{@college.id}"
    end



    delete '/college/:id' do
      @college = College.find_by_id(params[:id])
      @college.delete
      redirect '/'
    end

end
# Update and create in Rails = post
