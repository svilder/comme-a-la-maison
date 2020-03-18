class AddReferencestoResources < ActiveRecord::Migration[6.0]
  def change
      add_reference :resources, :objectif, index: true
      add_reference :resources, :public, index: true
      add_reference :resources, :activity_type, index: true
  end
end
