class AccessController < ApplicationController
  def login
    
  end
  
  def attempt_login
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = @user.id
      redirect_to action: 'profile', controller: 'users', id: @user.id
    else
      # Create an error message.
      flash.now[:alert] = 'Invalid username/password combination'
      render 'login'
    end
  end
  
  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to action: 'index', controller: 'pages'
  end
end
