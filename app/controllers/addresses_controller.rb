class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :area_id, :municipalities, :building, :address, :phone).merge(
      user_id: current_user.id, order_id: params[:order_id]
    )
    order_id
  end
end
