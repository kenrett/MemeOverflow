class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :url, null: false
      t.references :creator, null: false
      t.integer :score, default: 0
      t.string :slug, null: false

      t.timestamps
    end
    add_index :memes, :creator_id
  end
end
