class AddcolumsToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :kids, :boolean
    add_column :resources, :adults, :boolean
    add_column :resources, :fun, :boolean
    add_column :resources, :learn, :boolean
    add_column :resources, :read, :boolean
    add_column :resources, :listen, :boolean
    add_column :resources, :play, :boolean
    add_column :resources, :make, :boolean
    add_column :resources, :watch, :boolean
  end
end
