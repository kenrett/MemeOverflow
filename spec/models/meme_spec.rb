require 'spec_helper'

describe Meme do
  context 'on user creation' do
    let!(:sam) { User.create(full_name: "sidney", email: "sidney@gmail.com") }
    let!(:meme) { Meme.create(url: "www.google.com", creator: sam) }
    it "creates a randomly generated slug" do
      meme.slug.length.should eq(8) 
    end
  end 
end
