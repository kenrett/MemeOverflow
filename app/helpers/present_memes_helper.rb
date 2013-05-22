# REVIEW: indentation!
module PresentMemesHelper

    def render_presenter_box(meme)
    render :partial => "present_memes/present_memes", :locals => {:meme => meme}
  end
end
