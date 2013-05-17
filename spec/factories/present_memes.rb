# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :present_meme, :class => 'PresentMemes' do
    order_serialized "MyString"
  end
end
