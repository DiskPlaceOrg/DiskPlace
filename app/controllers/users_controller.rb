class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    #sql = "SELECT * from file_keys_resources"
    #result = ActiveRecord::Base.connection.execute(sql)
    #p result.to_a
    #UserMailer.welcome_email(current_user).deliver_later
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.security_key = generate_security_key
      @user.save
      UserMailer.welcome_email(@user).deliver_now
      redirect_to login_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:users).permit(:nick_name, :email, :password, :password_confirmation)
  end

  def generate_security_key
    SecureRandom.hex(6)
  end
end
