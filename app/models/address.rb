class Address < ApplicationRecord
  belongs_to :order
  # belongs_to :area

  # validates :postcode, :area_id, :municipalities, :address, :phone, :order presence: true,

end
