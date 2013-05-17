class PresentMemesController < ApplicationController


  def show
    order = PresentMeme.last.parse
    next_meme = order.index(1)
    @meme = Meme.find(order[next_meme])
  end

  def next
    last_order = PresentMeme.last.parse
    if last_order.last == params[:id].to_i
      order = PresentMeme.produce_new_order.parse
      next_meme_index = 0
    else
      order = last_order
      next_meme_index = order.index(params[:id].to_i) + 1
    end
    @meme = Meme.find(order[next_meme_index])
    render :json => { :url => @meme.url, :id => @meme.id }
  end

end
