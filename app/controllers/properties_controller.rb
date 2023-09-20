class PropertiesController < ApplicationController
    def index
        @properties = if params[:search]
            Property.where('property_type LIKE ?', "%#{params[:search]}%")
            else
                Property.all
            end
        render json: @properties
    end
end
