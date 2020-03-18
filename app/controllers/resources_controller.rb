class ResourcesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

  def index

    if params[:query].present?
      sql_query = " \
        resources.description ILIKE :query \
        OR resources.link ILIKE :query \
      "
      @resources = Resource.approved.where(sql_query, query: "%#{params[:query]}%")
    else
      @resources = Resource.approved
      @resources = Resource.approved.where("#{params[:public]} = true") if params[:public]
      @resources = Resource.approved.where("#{params[:objectif]} = true") if params[:objectif]
      @resources = Resource.approved.where("#{params[:activity]} = true") if params[:activity]
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
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
    @resource.user_id = current_user.id
    if @resource.update(params[:resource])
      redirect_to resources_path
    else
      render :edit
    end
  end

  def approve
    approve_state
  end

  private

  def resource_params
    params.require(:resource).permit(:description, :link, :kids, :adults, :fun, :learn, :read, :listen, :play, :make, :watch, :user_id)
  end

  def approve_state
    @resource = Resource.find(params[:id])
    @resource.user_id = current_user.id
    @resource.state = "approved"
    if @resource.save
      redirect_to admin_resources_path
    else
      render "/admin/resources"
    end
  end
end
