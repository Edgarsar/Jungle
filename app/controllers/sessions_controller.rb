class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user && user.authenticate(params[:password])
    # sets up user.id sessions
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash[:danger] = 'Invalid email/password combination' 
      render :new
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

end
