FactoryBot.define do
  factory :audience do
    uid { Faker::Internet.uuid }
    name { Faker::App.name }
  end
end
