FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { 'hoge' }
    house_number { 'hoge' }
    building { 'hoge' }
    phone_number { '0123456789' }
    item_id { '1' }
    user_id { '1' }
    token { 'tok_64a34fcaa90e5a9c1097f10d2944' }
    number { '4242424242424242' }
    exp_month { '12' }
    exp_year { '31' }
    cvc { '123' }
  end
end
