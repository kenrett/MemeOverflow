class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email, null: false
      t.string :user_token
      t.string :user_secret
      t.string :auth_status, default: "user"
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
