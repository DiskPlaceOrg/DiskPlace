class ResourcesController < ApplicationController
  def index
    @resources = Resource.order('created_at')
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:notice] = 'Successfully added new photo!'
      redirect_to root_path
    else
      flash[:alert] = 'Error adding new photo!'
      render :new
    end
  end

  private

  def photo_params
    params.require(:resource).permit(:file)
  end
end
