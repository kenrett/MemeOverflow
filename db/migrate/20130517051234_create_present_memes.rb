class CreatePresentMemes < ActiveRecord::Migration
  def change
    create_table :present_memes do |t|
      t.string :order_serialized

      t.timestamps
    end
  end
end
