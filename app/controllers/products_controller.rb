class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  # def add_to_cart
  #   @product = Product.find(params[:id])
  #
  #   if @product.quantity == 0
  #     flash[:notice] = "没有存货"
  #     redirect_to back
  #   else
  #     #if @product.quantity > 0
  #     current_cart.cart_items.each do |e|
  #       if e.product.quantity.present?
  #         flash[:notice] = "已在购物车,多加一件"
  #         current_cart.add_product_to_cart(@product)
  #       else
  #         current_cart.add_product_to_cart(@product)
  #         flash[:notice] = "添加成功"
  #         redirect_to :back
  #       end
  #     end
  #     #end
  #   end
  # end


  def add_to_cart
    @product = Product.find(params[:id])

    if @product.quantity > 0
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "添加成功"
      redirect_to :back
    else
      flash[:notice] = "没有库存，无法购买"
      redirect_to product_path
    end
  end




    # if @product.quantity > 0
    #   current_cart.cart_items.each do |e|
    #     if e.product.quantity.present?
    #       flash[:notice] = "已在购物车"
    #       redirect_to :back
    #     else
    #       current_cart.add_product_to_cart(@product)
    #       flash[:notice] = "添加成功"
    #       redirect_to :back
    #     end
    #   end
    # end

    #redirect_to :back
  # end

end
