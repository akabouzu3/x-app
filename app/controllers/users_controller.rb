class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(new_params)
  end

  private 
    def new_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end


end
