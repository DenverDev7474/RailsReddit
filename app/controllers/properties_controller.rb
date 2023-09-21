class PropertiesController < ApplicationController
    PAGE_SIZE = 1

    def index
        @properties = Property.all
      
        if params[:query]
            @properties = @properties.where("
                address Like :query OR
                city Like :query OR
                state Like :query OR
                zip Like :query OR
                price Like :query OR
                beds Like :query OR
                baths Like :query OR
                square_feet Like :query OR
                lot_size Like :query OR
                year_built Like :query OR
                days_on_market Like :query OR
                monthly_hoa Like :query OR
                mls_number Like :query OR
                identifier Like :query OR
                description Like :query
            ", query: "%#{params[:query]}%")

            @properties.page(params[:page]).per(PAGE_SIZE)
            render json: { properties: @properties,  totalPages: @properties.page.total_pages, totalCount: @properties.count }
        end
    end

    def show
        @property = Property.find(params[:id])
        render json: @property
      end

end
