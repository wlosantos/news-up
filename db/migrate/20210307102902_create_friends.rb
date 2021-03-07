class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
