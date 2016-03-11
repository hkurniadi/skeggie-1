class UsersController < ApplicationController
  
  def profile
    @user = User.find(params[:id])
  end
  
  def show
		@user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = current_user
		if @user.update(user_params)
			redirect_to :back, alert: "Succesfully updated."
    else
      render 'edit'
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to action: 'profile', id: @user.id
    else
      flash.now[:alert] = "Username already taken, please enter a different username."
      render 'new'
    end
  end
  
  def schedule
    
  end
  
  def cart
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, {:past_courses => []}, :address, {:friend_ids => []}, {:current_courses => []}, :password, :password_confirmation, :major)
  end
  
end
