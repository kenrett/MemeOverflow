class Home::IndexPresenter

  STATUSES = ["created_at", "score"]

  def initialize(current_user, sort_by_params, page_params)
    @current_user = current_user
    @sort_by_params = sort_by_params
    @page_params = page_params
  end

  def memes
    sort_by = sort_by(@sort_by_params)
    Meme.where("score > ?", -10).paginate(:page => @page_params, :per_page => 30).order("#{sort_by} DESC")
  end

  def leaders
    User.order("score DESC").limit(10)
  end

  def sort_by(sort_params)
    if sort_params && STATUSES.include?(sort_params)
      sort_params
    else
      "created_at"
    end
  end

end
