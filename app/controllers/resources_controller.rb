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
      flash[:notice] = 'Successfully added new resource!'
      redirect_to root_path
    else
      flash[:alert] = 'Error adding new resource!'
      render :new
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    if @resource.destroy
      flash[:notice] = 'Successfully deleted resource'
      redirect_to root_path
    else
      flash[:alert] = 'Error deleted resource'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:file)
  end
end
