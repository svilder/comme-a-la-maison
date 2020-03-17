class ResourcesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @resources = Resource.all
    # @resources = Resource.where(state: "approved")
  end

  def new
    @resource = Resource.new
    @objectif = Objectif.new
    @activity_type = ActivityType.new
    @public = Public.new
  end

  def create
    @resource = Resource.new(resource_params)
    create_objectif
    create_public
    create_activity_type
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
    params.require(:resource).permit(:description, :link, :public_id, :objectif_id, :activity_type_id)
  end

  def create_objectif
    @objectif = Objectif.create!(:apprentissage, :divertissement)
  end

  def create_public
    @activity_type = ActivityType.create!(:regarder, :lire, :ecouter, :jouer, :fabriquer)
  end

  def create_activity_type
    @public = Public.create!(:enfants, :adultes)
  end
end
