class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :municipalities, :address, :building, :phone, :order_id, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :municipalities, :address, :user_id, :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'number is too short' }, numericality: { only_integer: true, message: ' number is invalid. Input only number' }
    validates :token
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, municipalities: municipalities, address: address, building: building,
                   phone: phone, order_id: order.id)
  end
end
