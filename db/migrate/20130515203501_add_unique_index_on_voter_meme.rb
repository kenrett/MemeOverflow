class AddUniqueIndexOnVoterMeme < ActiveRecord::Migration
  def change
    add_index "votes", ["voter_id", "meme_id"], :unique => true
  end
end
