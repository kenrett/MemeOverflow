class PresentMemesController < ApplicationController


  def show
    order = PresentMeme.last.parse
    next_meme = order.first
    @meme = Meme.find(next_meme)
    respond_to do |format|
      format.html { render :layout => false}
    end

  end

  def next
    retrieve_last_order
    find_or_create_new_order_and_change_next_meme_index
    @meme = Meme.find(order[next_meme_index])
    render :json => { :url => @meme.url, :id => @meme.id }
  end

private
  
  def retrieve_last_order
    last_order = PresentMeme.last.parse
  end

  def find_or_create_new_order_and_change_next_meme_index
      if last_order.last == params[:id].to_i
      generate_new_order
      next_meme_index = 0
    else
      order = last_order
      next_meme_index = order.index(params[:id].to_i) + 1
    end
  end

  def generate_new_order
    order = PresentMeme.produce_new_order.parse
  end

end
