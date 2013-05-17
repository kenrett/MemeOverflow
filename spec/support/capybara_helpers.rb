module CapybaraHelpers
  def login(user)
    User.stub(:find_or_create_user_by_uid).and_return user
  end
end
