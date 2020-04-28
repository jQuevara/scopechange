class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:session][:email]

    if  @user && @user.authenticate(params[:session][:password])
      log_in_user

      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    cookies[:user_id] = nil

    redirect_to root_path
  end
end

private

def log_in_user
  session[:user_id] = @user.id
  cookies[:user_id] = @user.id
end