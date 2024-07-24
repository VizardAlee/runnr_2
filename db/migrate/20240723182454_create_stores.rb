class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
