# REVIEW: maybe it's due to bad naming, but I don't understand what PresentMeme is.
class PresentMeme < ActiveRecord::Base
  attr_accessible :order_serialized

  def self.produce_new_order
    # REVIEW: use self.create or just create
    PresentMeme.create(order_serialized: Meme.memes_to_show)
  end

  def parse
    self.order_serialized.split(";").map(&:to_i)
  end
end
