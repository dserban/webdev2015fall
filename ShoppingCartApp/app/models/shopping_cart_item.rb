class ShoppingCartItem < ActiveRecord::Base
  belongs_to :product

  def subtotal
    quantity * acquisition_price
  end
end

