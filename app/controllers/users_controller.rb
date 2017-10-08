class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    # debugger
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has successfully created"
      redirect_to users_path
    else 
      flash[:danger] = "Can't signup for new user"
      render "new"
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "User has update successfully"
      redirect_to users_path
    else
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "User has deleted with name #{@user.name}"
      redirect_to users_path
    else
      
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
