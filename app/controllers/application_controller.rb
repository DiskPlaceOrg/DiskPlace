class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_user_resources
    user = User.where(id: session[:user_id]).first
    session[:user_filter] = params[:filter] unless params[:filter].nil?
    if user && session[:user_filter].nil? && !params[:sort].nil?
      user.resources.order(params[:sort])
    elsif user && params[:sort].nil? && !session[:user_filter].nil? && session[:user_filter].eql?('all')
      user.resources.order('created_at')
    elsif user && !params[:sort].nil? && !session[:user_filter].nil? && session[:user_filter].eql?('all')
      user.resources.order(params[:sort])
    elsif user && params[:sort].nil? && !session[:user_filter].nil?
      user.resources.where(resource_type: session[:user_filter])
    elsif user && !params[:sort].nil? && !session[:user_filter].nil?
      user.resources.where(resource_type: session[:user_filter]).order(params[:sort])
    elsif user
      user.resources.order('created_at')
    end
  end

  def resource_file_filter(resource)
    image_extentions_arr = %w[jpg jpeg png svg bmp]
    music_extentions_arr = %w[mp3 wav mpeg]
    file_name = resource.file_content_type.split('/')[1]
    if file_name.in?(image_extentions_arr)
      resource.file.url
    elsif file_name.in?(music_extentions_arr)
      'MusicFile.jpg'
    else
      'TextFile.png'
    end
  end

  helper_method :current_user, :resource_file_filter, :current_user_resources
end
