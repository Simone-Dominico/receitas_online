class RevenuesController < ApplicationController

	before_action :signed_in_user

	def create
		@revenue = current_user.revenues.build(revenue_params)
		if @revenue.save
			flash[:success] = "Receita Adicionada!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

	private

	def revenue_params
		params.require(:revenue).permit(:preparation, :ingredients, :name, :category_id, :image)
	end
end