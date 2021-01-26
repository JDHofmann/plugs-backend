class UsersController < ApplicationController
    def index 
        users = User.all 

        render json: users
    end 

    def show 
        user = User.find(params[:id])


        render json: user
        # render json: user.to_json(
        #     except: [:created_at, :updated_at],
        #     include: [ orders: {
        #         except: [:created_at, :updated_at],
        #         include: [ 
        #             product_orders: {
        #             except: [:created_at, :updated_at],
        #             include: [ sku: {
        #                 only: [ :price ]
        #             } ]
        #         }
        #         ]
        #     } ]
        # ) 
    end     
end
