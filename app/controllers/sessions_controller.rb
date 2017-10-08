class SessionsController < ApplicationController
  def new

  end

  def create
    #debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to users_path(user)
    else
      flash.now[:danger] = "There was something wrong with our login information"
      render 'new'
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash.now[:success] = "You have successfully logged out"
      render "new"
    else
      flash[:notice] = "You are not log in yet"
      render "new"
    end
  end

end
