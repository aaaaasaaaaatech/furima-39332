class OrdersController < ApplicationController
  include ActiveModel::Model
  attr_accessor :item, :user
  before_action :authenticate_user!, only: [:index]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:item, :user).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
