class UpdateVoterIdColumn < ActiveRecord::Migration
  def up
    change_column :votes, :voter_id, :integer, :null => false
  end

  def down
    change_column :votes, :voter_id, :integer
  end
end
