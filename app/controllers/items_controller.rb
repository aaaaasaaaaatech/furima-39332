class ItemsController < ApplicationController
  # before_action :move_to_new, except: [:new]

  def index
    @item = Item.all

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
  end

  def move_to_new
    unless user_signed_in?
      redirect_to new_item
    else
      redirect_to user_session_path
    end
  end
end