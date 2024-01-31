class SessionsController < ApplicationController
  def new; end

  def create
    # user = User.find_by_email(params[:email])

    # If the user email and password is correct

    user = User.find_by_email(params[:email])
    
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id as a session_id to keep user logged in
      session[:user_id] = user.id
      redirect_to '/', notice: 'Successfully logged in!'
    else
      flash.now[:alert] = 'Incorrect email or password, please try again.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Successfully logged out!'
  end
end
