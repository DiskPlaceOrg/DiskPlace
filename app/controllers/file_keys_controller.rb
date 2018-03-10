class FileKeysController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    key = generate_file_key
    @resource = current_user.resources.find_by(id: params[:resource_id])
    @file_key = FileKey.new(file_key: key)
    if @file_key.save
      p key
      @resource.file_key << @file_key
      respond_to do |format|
        format.js { render file: 'file_keys/create' }
      end
    else
      p 'not saved!'
    end
  end

  def show
  end

  def destroy
  end

  private

  def generate_file_key
    "#{SecureRandom.hex(9)}t#{Time.now.strftime('%y%m%d%h%m%s')}#{current_user.id}"
  end
end
