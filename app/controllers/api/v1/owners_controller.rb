class Api::V1::OwnersController < Api::V1::ApiController
    def index
        @owners = Owner.limit(params[:length]).offset(params[:offset])
    end 

    def show
        @owner = Owner.find_by(name: params[:owner_name])
    end 
end 