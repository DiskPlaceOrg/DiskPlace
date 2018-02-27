class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def current_user
    User.where(id: session[:user_id]).first
  end

  def resource_file_filter(resource)
    image_extentions_arr = %w[jpg jpeg png svg bmp]
    music_extentions_arr = %w[mp3 wav mpeg]
    file_name = resource.file_content_type.split('/')[1]
    p file_name
    if file_name.in?(image_extentions_arr)
      resource.file.url
    elsif file_name.in?(music_extentions_arr)
      'MusicFile.jpg'
    else
      'TextFile.png'
    end
  end

  helper_method :current_user, :resource_file_filter
end
