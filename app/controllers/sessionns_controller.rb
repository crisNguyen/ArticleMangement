class SessionnsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice]="login successfully"
      redirect_to user
    else
      flash.now[:alert]="there was something wrong"
      render 'new'
    end

  end

  def destroy
    session[:user_id]=nil
    flash[:notice] ="Log out"
    redirect_to root_path
  end
end
