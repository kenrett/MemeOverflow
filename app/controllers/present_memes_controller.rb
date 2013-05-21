class PresentMemesController < ApplicationController

  def show
    Meme.count == 0 ? flash[:notice] = "There is currently no meme in the database" : @meme = find_next_meme(params[:id].to_i)  
    render :layout => false
  end

  def next
    @meme = find_next_meme(params[:id].to_i)
    render :json => { :url => @meme.url, :id => @meme.id }
  end

  private

  def find_next_meme(id)
    current_order = retrieve_current_order
    if !Meme.exists?(id) || last_meme?(current_order, id)
      order = generate_new_order
      next_meme_index = 0
    else
      order = current_order
      next_meme_index = order.index(id) + 1
    end
    next_meme_id = next_meme_id(order, next_meme_index)
    Meme.find(next_meme_id)
  end

  def next_meme_id(order, next_meme_index)
    order[next_meme_index]
  end

  def retrieve_current_order
    if current_order = PresentMeme.last
      current_order.parse
    else
      generate_new_order
    end
  end

  def generate_new_order
    PresentMeme.produce_new_order.parse
  end

  def last_meme?(current_order, id)
    current_order.last == id
  end
end
