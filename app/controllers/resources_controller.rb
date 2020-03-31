class ResourcesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @message = ""
    if params[:query].present?
      sql_query = " \
        resources.description ILIKE :query \
        OR resources.link ILIKE :query \
      "
      @resources = Resource.approved.where(sql_query, query: "%#{params[:query]}%").sort.reverse
      if @resources.count == 0
        @resources = Resource.last(2)
        @message = "⚠️ Aucune resource ne correspond à votre recherche.
        Vous pouvez proposer une ressource ou faire une autre cherche. ⚠️"
      end
    else
      @resources = Resource.approved.sort.reverse
      @resources = Resource.approved.where("#{params[:category]} = true").sort.reverse if params[:category]
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    if @resource.save
      # @user = current_user
      # ResourceMailer.with(user: @user).thanks.deliver_now
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
    @resource = Resource.find(params[:id])
    @resource.user_id = current_user.id
    @resource.state = "approved"
    if @resource.save
      @user = current_user
      ResourceMailer.with(user: @user).approved.deliver_now
      redirect_to admin_resources_path
    else
      render "/admin/resources"
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:description, :link, :kids, :adults, :fun, :learn, :read, :listen, :play, :make, :watch, :user_id)
  end

  def approve_state

  end
end
