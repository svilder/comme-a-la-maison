class RemoveReferenceToResources < ActiveRecord::Migration[6.0]
  def change
    remove_reference :resources, :objectif, index: true
    remove_reference :resources, :public, index: true
    remove_reference :resources, :activity_type, index: true
  end
end
