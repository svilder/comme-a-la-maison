class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :description
      t.string :link
      t.string :public
      t.string :objectif
      t.string :activity_type
      t.string :state, default: "pending"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
