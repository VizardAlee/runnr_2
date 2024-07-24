class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password, null: false, default: ""
      t.string :store_owner

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true

  end
end
