class PresentMeme < ActiveRecord::Base
  attr_accessible :order_serialized

  def self.produce_new_order
    PresentMeme.create(order_serialized: Meme.memes_to_show)
  end

  def parse
    self.order_serialized.split(";").map(&:to_i)
  end
end
