class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @orders = Order.where(item_id: @item.id)
  end

  def edit
    return unless @item.order.present? || (current_user.present? && current_user.id != @item.user_id)

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to action: :index
  end

  def move_to_new
    if user_signed_in?
      redirect_to user_session_path
    else
      redirect_to new_item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :charge_id, :area_id, :shippingday_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
