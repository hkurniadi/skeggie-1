class UsersController < ApplicationController
  
  def profile
		@user = User.find_by_username(params[:username])
  end
  
  def show
		@user = User.find(params[:id])
  end
  
  def edit
		@user = User.find_by_username(params[:username])
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
<<<<<<< HEAD
      redirect_to action: 'profile', username: @user.username
=======
			redirect_to action: 'profile', username: @user.username
>>>>>>> 22d828ee20c8ebe15dbb21402defb036f59ff6ad
    else
      flash.now[:alert] = "Username already taken, please enter a different username."
      render 'new'
    end
  end
  
  def schedule
		@current_courses = User.find_by_username(params[:username]).current_courses
  end
  
  def cart
    
  end
  
	def search
		@user = User.all
	end
	
  private
  
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, {:past_courses => []}, :address, {:friend_ids => []}, {:current_courses => []}, :password, :password_confirmation, :major)
  end
  
end
