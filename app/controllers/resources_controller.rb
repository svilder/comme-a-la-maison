class ResourcesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @resources = Resource.where(state: "approved")
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to resources_path
    else
      render :new
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update(params[:resource])
      redirect_to resources_path
    else
      render :edit
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:description, :link, :public, :objectif, :activity_type)
  end
end
