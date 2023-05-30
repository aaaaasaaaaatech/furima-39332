FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.sentence }
    explanation     { Faker::Lorem.sentence }
    category_id     { 1 }
    condition_id    { 1 }
    charge_id       { 1 }
    area_id         { 1 }
    shippingday_id  { 1 }
    price           { 400 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
