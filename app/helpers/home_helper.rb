module HomeHelper
  def render_meme_box(meme)
    render :partial => "memes/meme", :locals => {:meme => meme}
  end
end
