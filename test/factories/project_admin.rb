FactoryBot.define do
  factory :project_admin do
    name Faker::Name.unique.name
    sequence(:email){|n| "test_#{n}@yopmail.com"}
    password Faker::Internet.password(8)
  end
end
