FactoryBot.define do
  factory :address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { 'hoge' }
    house_number { 'hoge' }
    building { 'hoge' }
    phone_number { '0123456789' }
    association :order
  end
end
