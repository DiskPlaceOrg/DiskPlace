class FileKeysController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]
  def create
    key = generate_file_key
    @resource = current_user.resources.find_by(id: params[:resource_id])
    @files_key = @resource.file_key.build(file_key: key)
    if @files_key.save
      p 'saved'
      p key
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
    "#{SecureRandom.hex(18)}t#{Time.now.strftime("%y%m%d%h%m%s")}#{current_user.id}"
  end
end
