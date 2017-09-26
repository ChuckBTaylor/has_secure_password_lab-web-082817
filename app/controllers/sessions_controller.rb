class SessionsController < ApplicationController


  def new

  end

  def create
    user = User.find_by(name: params[:user][:name])
    @user = user.authenticate(params[:user][:password]) ? user : nil
    if @user
      login(@user.id)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

end
