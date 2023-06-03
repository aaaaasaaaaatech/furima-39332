class OrdersController < ApplicationController
  include ActiveModel::Model
  attr_accessor :item, :user
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
 
  def index
    @order_address = OrderAddress.new
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_address =  OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :area_id, :municipalities, :address, :building, :phone, :order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
