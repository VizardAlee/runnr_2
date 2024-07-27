class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :switch_role]
  before_action :authorize_admin, only: [:show]
  before_action :authorize_user_for_role_switch, only: [:switch_role]

  def index
    @users = User.all
  end

  def show
    if @user.nil?
      redirect_to users_path, alert: 'User not found'
    else
      @store = @user.store # Assuming a user has many stores
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User created successfully!"
    else
      render :new
    end
  end

  def switch_role
    if @user.nil?
      redirect_to root_path, alert: 'User not found'
    else
      new_role = @user.role == 'admin' ? 'user' : 'admin'
      if @user.update(role: new_role)
        redirect_to root_path, notice: 'User role updated successfully.'
      else
        redirect_to root_path, alert: 'Failed to update user role.'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def authorize_user_for_role_switch
    unless current_user == @user
      redirect_to root_path, alert: 'You are not authorized to switch this user\'s role.'
    end
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
