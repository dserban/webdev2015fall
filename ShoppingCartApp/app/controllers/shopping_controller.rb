class ShoppingController < ActionController::Base
  def cart
    @all_products = Product.all
    @all_shopping_cart_items = ShoppingCartItem.all
    @shopping_cart_total = 0
    @all_shopping_cart_items.each do |item|
      @shopping_cart_total += item.subtotal
    end
  end

  def addnewproduct
    params_description = params[:description]
    params_price = params[:price].to_i
    Product.create( { :description => params_description,
                      :price       => params_price } )
    redirect_to '/cart'
  end

  def addtoshoppingcart
    params_product_id = params[:id].to_i
    params_quantity = params[:quantity].to_i
    item = ShoppingCartItem.find_by(:product_id => params_product_id)
    if item
      item.update( { :quantity => item.quantity + params_quantity } )
    else
      product = Product.find_by(:id => params_product_id)
      ShoppingCartItem.create( { :product_id        => params_product_id,
                                 :acquisition_price => product.price,
                                 :quantity          => params_quantity } )
    end
    redirect_to '/cart'
  end

  def resetshoppingcart
    ShoppingCartItem.destroy_all
    redirect_to '/cart'
  end
end

