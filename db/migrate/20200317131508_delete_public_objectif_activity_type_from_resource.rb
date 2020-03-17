class DeletePublicObjectifActivityTypeFromResource < ActiveRecord::Migration[6.0]
  def change
     remove_column :resources, :public
     remove_column :resources, :objectif
     remove_column :resources, :activity_type
  end
end
