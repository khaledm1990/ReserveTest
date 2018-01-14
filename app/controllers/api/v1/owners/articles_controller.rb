class Api::V1::Owners::ArticlesController < Api::V1::ApiController

	def articles_by_owner_name
		@owner = Owner.find_by(name: params[:owner_name])
	end 
end 