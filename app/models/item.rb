class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :shippingday
  has_one_attached :image
  validates :name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :shippingday_id, :image, presence: true
  validates :price, presence: true, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :category_id, :condition_id, :charge_id, :area_id, :shippingday_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
