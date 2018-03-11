class SessionsController < ApplicationController
  def new
    redirect_to user_path(session[:user_id]) unless session[:user_id].nil?
  end

  def create
    user = User.find_by_email(params[:email])
    if params[:security_key] && params[:security_key].eql?(user.security_key)
      user.security_key ='0'
      user.save
    end
    if user && user.authenticate(params[:password]) && user.security_key.eql?('0')
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    elsif params[:security_key].nil?
      render 'sessions/new_sk'
    else
      render :new
    end
  end

  def destroy
    session[:user_filter] = nil
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end
