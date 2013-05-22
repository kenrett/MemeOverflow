class MemeDecorator < Draper::Decorator
  delegate_all

  def upvote_button
    if h.current_user.nil? || h.user_votes[object.id] != "up"
      vote_button("Upvote", {:id => "up#{object.id}", :value => "up", :class => "btn vote"})
    else
      vote_button("Upvote", {:id => "no_up#{object.id}", :value => "no_up", :class => "btn vote btn-success"})
    end
  end

  def downvote_button
    if h.current_user.nil? || h.user_votes[object.id] != "down"
      vote_button("Downvote", {:id => "down#{object.id}", :value => "down", :class => "btn vote"})
    else
      vote_button("Downvote", {:id => "no_down#{object.id}", :value => "no_down", :class => "btn vote btn-success"})
    end
  end

  def vote_button(name, options)
    h.button_tag name, {:name => "vote_type"}.merge(options)
  end

  def url_size(size)
    if size == :small
      "/convert?w=300&h=300"
    elsif size == :big
      "/convert?w=600&h=600"
    elsif size.class == Array
      "/convert?w=#{size[0]}&h=#{size[1]}"
    end
  end
end
