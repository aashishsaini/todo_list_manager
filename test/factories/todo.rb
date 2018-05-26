FactoryBot.define do
  factory :todo do
    name Faker::Name.unique.name
    description Faker::Movie.quote
    user
    project
  end
end
