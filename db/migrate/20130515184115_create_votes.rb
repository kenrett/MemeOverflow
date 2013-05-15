class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :type, null: false
      t.references :meme
      t.references :voter

      t.timestamps
    end
    add_index :votes, :meme_id
    add_index :votes, :voter_id
  end
end
