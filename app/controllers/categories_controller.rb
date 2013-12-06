class CategoriesController < ApplicationController
	def index
		@categories = Category.find_by(name: params[:name])
		render 'show'
	end
	def show
		@category = Category.find_by(name: params[:name])
		@revenues = @category.revenues.paginate(page: params[:page])
	end
end
