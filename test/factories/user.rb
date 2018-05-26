FactoryBot.define do
	factory :user do
    name Faker::Name.unique.name
    sequence(:email){|n| "test_#{n}@yopmail.com"}
    password Faker::Internet.password(8)
    type 'Developer'
  end
end
