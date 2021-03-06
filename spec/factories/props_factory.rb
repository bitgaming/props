FactoryGirl.define do
  factory :prop do
    body FFaker::Lorem.paragraph
    association :propser, factory: :user
    after :build do |prop|
      prop.prop_receivers.new(user: create(:user))
    end

    trait :with_upvote do
      after(:create) do |prop|
        prop.upvotes << create(:upvote)
      end
    end
  end
end
