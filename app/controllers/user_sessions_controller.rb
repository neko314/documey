class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    if current_user
      redirect_to user_seminars_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to user_seminars_path(@user), notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
