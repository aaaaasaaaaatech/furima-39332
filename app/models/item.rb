class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :shippingday
  has_one_attached :image
  validates :name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :shippingday_id, :image, presence: true
  validates :price,presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
