class UsersController < ApplicationController
  
  def profile
    @user = User.find[:id]
  end
  
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
          redirect_to @user
        else
            render 'new'
        end
  end
  
  def schedule
    
  end
  
  def cart
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :past_courses, :address, :friend_ids, :current_courses, :password)
  end
  
end
