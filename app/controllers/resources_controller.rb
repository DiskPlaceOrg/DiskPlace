class ResourcesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  helper_method :sort_column

  def index
    @resources = current_user.resources
  end

  def show
    @resource = current_user.resources.find_by(id: params[:id])
    respond_to do |format|
      @java_url = "/home/ajax_download?file=#{@resource.id}"
      format.all{
        send_file @resource.file.path,
                            filename: @resource.file_file_name,
                            type: @resource.file_content_type }
      format.js { render :partial => 'downloadFile'}
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = current_user.resources.build(file: resource_params[:file])
    if @resource.save
      set_resource_type(@resource)
      flash[:notice] = 'Successfully added new resource!'
      redirect_to current_user
    else
      flash[:alert] = 'Error adding new resource!'
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

  def ajax_download
    extension = @resource.file_file_name.split('.')
    send_file Rails.root.join('public', 'system', 'attachment', 'original', @resource.file_file_name).to_json,
              :type => "application/#{extension[1]}", :x_sendfile => true
  end
  private

  def resource_params
    params.require(:resource).permit(:file)
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
    video_extentions_arr = %w[mp4]
    file_name = resource.file_content_type.split('/')[1]
    if file_name.in?(image_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'image')
    elsif file_name.in?(music_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'audio')
    elsif file_name.in?(video_extentions_arr)
      Resource.where(id: resource.id).update_all(resource_type: 'video')
    else
      Resource.where(id: resource.id).update_all(resource_type: 'file')
    end
  end

end
