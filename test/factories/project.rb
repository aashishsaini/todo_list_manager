FactoryBot.define do
  factory :project do
    name Faker::Name.unique.name
    description Faker::Movie.quote
  end
end
