require 'spec_helper'

describe PresentMeme do
  context "#self.produce_new_order" do
    before(:each) do
      60.times do
        create(:meme)
      end

      1.upto(20) do |i|
        create(:vote, :meme_id => i)
      end
    end

    it "produces an present meme object which stores orders as a serialized string" do
      PresentMeme.produce_new_order.should be_valid
      PresentMeme.produce_new_order.order_serialized.should be_an_instance_of(String)
    end

    it "should not produce any duplicate meme entries" do
      order = PresentMeme.produce_new_order.parse
      order.uniq.length.should eq(order.length)
    end

    it "should include the 1 to 20 memes as they are the most popular" do
      order = PresentMeme.produce_new_order.parse
      order.sort.first(20).should eq((1..20).to_a)
    end

    it "should include the 41 to 60 memes as they are the latest" do
      order = PresentMeme.produce_new_order.parse
      order.sort.last(20).should eq((41..60).to_a)
    end
  end
end
