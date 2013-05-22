# REVIEW: this controller has a crazy name and crazy methods. I don't get it. It needs major refactoring and lots of love.
class PresentMemesController < ApplicationController

  def show
    # REVIEW: Meme.count.zero?
    # I love one liners and I'm the first to support it, but you're doing too much here.
    Meme.count == 0 ? flash[:notice] = "There is currently no meme in the database" : @meme = find_next_meme(params[:id].to_i)
    render :layout => false
  end

  def next
    # REVIEW: what's the purpose of line 13? why are you creating this instance variable?
    @meme = find_next_meme(params[:id].to_i)
    render :json => { :url => @meme.url, :id => @meme.id }
  end

  private

  def find_next_meme(id)
     # REVIEW: why are you setting this current_order variable?
     # I bet you we can shrink this method into couple of lines of code.
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
    # REVIEW if current_order actually returns and id, then rename it to current_order_id
    current_order.last == id
  end
end
