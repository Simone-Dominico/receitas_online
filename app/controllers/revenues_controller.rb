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
	def edit
	end

	def update
		if @revenue.update_attributes(revenue_params)
			flash[:success] = "Receita alterada com Sucesso"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

	def revenue_params
		params.require(:revenue).permit(:preparation, :ingredients, :name, :category_id, :image)
	end
end