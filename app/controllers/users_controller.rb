class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :own_profile, only: [:show]
  
  def show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], description: params[:description])
      flash[:success] = "Profile Update!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def own_profile
    if params[:id].to_i == current_user.id
    else
      redirect_to user_path(current_user.id)
    end
  end
end
