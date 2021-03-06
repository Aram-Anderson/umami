class UsersController < ApplicationController
  before_action :require_user, only: [:dashboard]

  def dashboard
    @popular_items = Item.by_popularity.limit(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.name}"
      UserNotifier.send_signup_email(@user).deliver
      # redirect_to(@user, :notice => 'User created')
      redirect_to dashboard_path
    else
      flash[:notice] = "All Fields are Required"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :password, :image)
  end

end
