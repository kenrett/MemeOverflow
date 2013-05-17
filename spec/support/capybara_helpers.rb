module CapybaraHelpers
  def test_login(user)
    User.stub(:find_or_create_user_by_uid).and_return user
  end

  def stub_current_user(user)
    ApplicationController.any_instance.stub(:current_user).and_return user
  end
end
