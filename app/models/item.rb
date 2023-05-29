class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :shippingday
  validates :name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :shippingday_id, :price, presence: true
end
