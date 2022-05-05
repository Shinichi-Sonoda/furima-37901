FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    explanation { Faker::Lorem.sentences }
    category_id { Faker::Number.between(from: 2, to: 11)}
    condition_id { Faker::Number.between(from: 2, to: 6)}
    shipping_fee_condition_id { Faker::Number.between(from: 2, to: 3)}
    prefecture_id { Faker::Number.between(from: 2, to: 48)}
    lead_time_id { Faker::Number.between(from: 2, to: 4)}
    price { Faker::Number.between(from: 301, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/database_config.png'), filename: 'database_config.png')
    end
    
  end
end
