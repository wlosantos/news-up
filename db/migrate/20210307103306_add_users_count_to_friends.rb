class AddUsersCountToFriends < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :users_count, :integer
  end
end
