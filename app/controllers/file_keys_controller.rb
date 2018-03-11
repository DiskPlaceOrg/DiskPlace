class FileKeysController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create destroy]

  def index
    @file_keys = FileKey.includes(:resource).where('resources.id' => current_user.resources.ids)
    @resources = Resource.includes(:file_key).where('file_keys.id' => @file_keys.ids)
  end

  def create
    key = generate_file_key
    @resource = current_user.resources.where(id: params[:resource_id].split(','))
    @file_key = FileKey.new(file_key: key)
    if @file_key.save
      p key
      @resource.each do |r|
        r.file_key << @file_key
      end
      respond_to do |format|
        format.js { render file: 'file_keys/create' }
      end
    else
      p 'not saved!'
    end
  end

  def shows
  end

  def destroy
    @file_keys = FileKey.includes(:resource).where('resources.id' => current_user.resources.ids)
    deleted_key = @file_keys.find_by(id: params[:id])
    if deleted_key
      deleted_key.delete
    end
  end

  private

  def generate_file_key
    "#{SecureRandom.hex(9)}t#{Time.now.strftime('%y%m%d%h%m%s')}#{current_user.id}"
  end
end
