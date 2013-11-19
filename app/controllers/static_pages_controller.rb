class StaticPagesController < ApplicationController
	def home
  	  @revenue = current_user.revenues.build if signed_in?
  	end

	def help
	end

	def about
	end

	def contact
	end

end
