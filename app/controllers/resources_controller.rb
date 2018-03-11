class ResourcesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  helper_method :sort_column

  def index
    @resources = current_user.resources
  end

  def show; end

  def new
    @resource = Resource.new
  end

  def create
    @resource = current_user.resources.build(resource_params[:files])
    if current_user.save
      #set_resource_type(@resource)
      redirect_to current_user
    else
      render :new
    end
end

  def destroy
    @resource = current_user.resources.find(params[:id])
    if @resource.destroy
      flash[:notice] = 'Successfully deleted resource'
    else
      flash[:alert] = 'Error deleted resource'
    end
  end

  def download
    @resource = Resource.find_by(id: params[:id])
    send_file @resource.file.path, :type => "application/#{@resource.file_content_type}", :filename => @resource.file_file_name
  end

  private

  def resource_params
    params.require(:resource).permit(files: [:file])
  end

  def sort_column
    params.require(:sorting).permit[:sort] || 'created_at'
  end

  def filter_column
    params.require(:filtering).permit(:filter)
  end

  def set_resource_type(resource)
    image_extentions_arr = %w[jpg jpeg png svg bmp]
    music_extentions_arr = %w[mp3 wav mpeg]
    archive_extentions_arr = %w[rar zip x-bzip]
    video_extentions_arr = %w[mp4]
    file_name = resource.file_content_type.split('/')[1]
    if file_name.in?(image_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'image')
    elsif file_name.in?(music_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'audio')
    elsif file_name.in?(video_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'video')
    elsif file_name.in?(archive_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'archive')
    else
      Resource.where(id: resource.id).update_all(resource_type: 'file')
    end
  end
end
