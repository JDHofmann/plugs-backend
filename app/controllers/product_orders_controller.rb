class ProductOrdersController < ApplicationController


    def show 
        product_order = ProductOrder.find(params[:id])

        render json: product_order
    end 

end
