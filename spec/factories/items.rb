FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.sentence }
    explanation     { Faker::Lorem.sentence }
    category_id     { 2 }
    condition_id    { 2 }
    charge_id       { 2 }
    area_id         { 2 }
    shippingday_id  { 2 }
    price           { 400 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
