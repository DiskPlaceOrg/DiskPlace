class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  protect_from_forgery with: :exception
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_user_resources
    user = User.where(id: session[:user_id]).first
    session[:user_filter] = params[:filter] unless params[:filter].nil?
    filter = session[:user_filter]
    sort = params[:sort] || 'created_at'
    if params[:file_key]
      key_collect =  FileKey.where(file_key: params[:file_key])
      Resource.includes(:file_key).where('file_keys.id' => key_collect)
    elsif user && filter.nil? && sort
      user.resources.order(sort)
    elsif user && sort.nil? && filter && filter.eql?('all')
      user.resources.order(sort)
    elsif user && sort && filter && filter.eql?('all')
      user.resources.order(sort)
    elsif user && sort.nil? && filter
      user.resources.where(resource_type: filter)
    elsif user && sort && filter
      user.resources.where(resource_type: filter).order(sort)
    elsif user
      user.resources.order(sort)
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
