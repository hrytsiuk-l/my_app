# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    uid { Faker::Code.npi }
    name { Faker::Name.unique.name }
    association :audience
  end
end
