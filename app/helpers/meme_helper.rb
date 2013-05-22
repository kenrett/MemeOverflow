module MemeHelper
  def render_meme_box(meme, size)
    render :partial => "memes/meme", :locals => {:meme => meme, :size => size}
  end
end
