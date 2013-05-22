# REVIEW: this looks good, rails also has a specific way of implemeting presenters,
# read up on rails presenter pattern. A common pattern you'll see in presenter is to
# pass the controller as a parameter and deletage calls to current_user to it. This
# will avoid you passing in current_user or other controller helpers.
class Home::IndexPresenter

  # REVIEW: those don't sound like statuses to me, is this a descriptive name?
  STATUSES = ["created_at", "score"]

  def initialize(current_user, sort_by_params, page_params)
    @current_user = current_user
    @sort_by_params = sort_by_params
    @page_params = page_params
  end

  def memes
    sort_by = sort_by(@sort_by_params)
    # REVIEW: this should be moved to a class method on Meme model. This is tightly coupled
    # with Meme implementation.
    Meme.where("score > ?", -10).paginate(:page => @page_params, :per_page => 30).order("#{sort_by} DESC")
  end

  def leaders
    User.order("score DESC").limit(10)
  end

  def sort_by(sort_params)
    # REVIEW: this code needs to be refactored. What's the purpose of the assignment on line 30?
    # why not:  STATUSES.include?(sort_params) ? sort_params : "score" for example
    if sort_params && STATUSES.include?(sort_params)
      sort_by = sort_params
    else
      sort_by = "score"
    end
  end

end
