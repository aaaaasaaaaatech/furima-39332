class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  def index
    @items = Item.all
    charge_id_names= { 2 => '着払い(購入者負担)', 3 => '送料込み(出品者負担)' } 
    @charge_id_names = charge_id_names
    # @sold_out_items = calculate_sold_out_items(@items)
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
    @item = Item.find(params[:id])
    @username = @item.user.nickname
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

  # def calculate_sold_out_items(items)
  #   items.select { |item| item.sold_out? }
  # end
end
