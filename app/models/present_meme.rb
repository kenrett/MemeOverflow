class PresentMeme < ActiveRecord::Base
  attr_accessible :order_serialized

  def self.produce_new_order
    latest_20_memes = Meme.latest_20_memes.pluck(:id)
    memes_to_show = (latest_20_memes).shuffle.join(";")
    PresentMeme.create(order_serialized: memes_to_show)
  end

  def parse
    self.order_serialized.split(";").map(&:to_i)
  end
end
