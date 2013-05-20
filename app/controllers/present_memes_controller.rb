class PresentMemesController < ApplicationController

  def show
    if Meme.count == 0
      flash[:notice] = "There is currently no meme in the database"
    else
      current_order = retrieve_current_order
      @meme = find_next_meme(current_order)
    end
    respond_to do |format|
      format.html { render :layout => false}
    end
  end

  def next
    current_order = retrieve_current_order
    @meme = find_next_meme(current_order)
    render :json => { :url => @meme.url, :id => @meme.id }
  end

private

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

  def find_next_meme(current_order)
    if !Meme.exists?(params[:id].to_i) || last_meme?(current_order)
      order = generate_new_order
      next_meme_index = 0
    else
      order = current_order
      next_meme_index = order.index(params[:id].to_i) + 1
    end
    next_meme_id = next_meme_id(order, next_meme_index)
    Meme.find(next_meme_id)
  end

  def next_meme_id(order, next_meme_index)
    order[next_meme_index]
  end

  def last_meme?(current_order)
    current_order.last == params[:id].to_i
  end
end
