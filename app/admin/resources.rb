ActiveAdmin.register Resource do
  menu priority: 1
  config.per_page = 10

  action_item :view_site do
    link_to "Voir le site", "/", target: "_blank"
  end

  action_item :view do
    link_to "Retour sur l'index des resources", "/admin/resources"
  end

  controller do
    def create
      super do |format|
        redirect_to admin_resources_path and return
      end
    end
    def update
      super do |format|
        redirect_to admin_resource_path and return
      end
    end
    def approve
      super do |format|
        redirect_to admin_resources_path and return
      end
    end
    def destroy
      super do |format|
        redirect_to admin_resources_path and return
      end
    end
  end

  index do
    selectable_column
    column "Lien" do |resource|
      link_to resource.link, admin_resource_path(resource)
    end
    column "APPROVE", sortable: :state do |resource|
      link_to resource.state, approve_path(resource), method: :patch
    end
    column "Kids", sortable: :kids do |resource|
      link_to resource.kids, admin_resource_path(resource)
    end
    column "Adults", sortable: :adults do |resource|
      link_to resource.adults, admin_resource_path(resource)
    end
    column "Fun", sortable: :fun do |resource|
      link_to resource.fun, admin_resource_path(resource)
    end
    column "Learn", sortable: :learn do |resource|
      link_to resource.learn, admin_resource_path(resource)
    end
    column "id", sortable: :id do |resource|
      link_to resource.id, admin_resource_path(resource)
    end
    actions
  end

  filter :kids
  filter :adults
  filter :fun
  filter :learn
  filter :created_at

  permit_params :description, :link, :kids, :adults,
      :fun, :learn, :read, :listen, :play, :make, :watch, :user_id, :state

  form title: "nouveau lien" do |f|
    f.inputs do
      f.input :link
      f.input :description
      f.input :state,collection: Resource::STATES
      f.input :kids, as: :boolean, checked_value: true, unchecked_value: false
      f.input :adults, as: :boolean, checked_value: true, unchecked_value: false
      f.input :fun, as: :boolean, checked_value: true, unchecked_value: false
      f.input :learn, as: :boolean, checked_value: true, unchecked_value: false
      f.input :read, as: :boolean, checked_value: true, unchecked_value: false
      f.input :listen, as: :boolean, checked_value: true, unchecked_value: false
      f.input :play, as: :boolean, checked_value: true, unchecked_value: false
      f.input :make, as: :boolean, checked_value: true, unchecked_value: false
      f.input :watch, as: :boolean, checked_value: true, unchecked_value: false
    end
    f.actions
  end

end
