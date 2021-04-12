FactoryBot.define do
  factory :driver do
    name Faker::Lorem.sentence
    email { Faker::Internet.unique.email }
    license_plate { "NKG464" }
  end
end
