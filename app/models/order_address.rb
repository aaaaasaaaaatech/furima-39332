class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :municipalities, :address, :building, :phone, :order_id, :user_id, :item_id
  
  with_options presence: true do
    validates :postcode, :phone
    validates :area_id, :municipalities, :address
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, area_id: area_id, municipalities: municipalities, address: address, building: building, phone: phone, order_id: order.id)
  end

end