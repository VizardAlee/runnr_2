class RenameUsersIdInStoresToUserId < ActiveRecord::Migration[7.1]
  def change
    rename_column :stores, :users_id, :user_id
  end
end
