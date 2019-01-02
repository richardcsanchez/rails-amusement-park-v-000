class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       render :new
     end
  end

  def show
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    end

  private


  def user_params
   params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
  end


end
