class ResourcesController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  def index
    @resources = Resource.order('created_at')
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = current_user.resources.build(file: resource_params[:file])
    if @resource.save
      flash[:notice] = 'Successfully added new resource!'
      redirect_to current_user
    else
      flash[:alert] = 'Error adding new resource!'
      render :new
    end
  end

  def destroy
    p 'destroy'
    @resource = current_user.resources.find(params[:id])
    if @resource.destroy
      flash[:notice] = 'Successfully deleted resource'
    else
      flash[:alert] = 'Error deleted resource'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:file)
  end
end
