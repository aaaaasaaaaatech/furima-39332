FactoryBot.define do
  factory :order_address do
    postcode          {"123-4567"}
    area_id           {2}
    municipalities    {'横浜市緑区'}
    address           {'青山1-1-1'}
    building          {'ハイビスカスビル205'}
    phone             {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end