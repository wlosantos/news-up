class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.integer :kind, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
