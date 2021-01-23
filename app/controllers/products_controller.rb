class ProductsController < ApplicationController

    def index 
        products = Product.all 

        render json: products.to_json(
            except: [:created_at, :updated_at],
            include: [ 
                skus: {
                    except: [:created_at, :updated_at]
                },
                product_options: {
                    only: [ :name, :id ],
                    include: [ product_option_values: {
                        only: [ :id, :name ]
                    }]
                }, 
            ]
        ) 
    end 

end
