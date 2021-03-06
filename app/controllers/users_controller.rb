class UsersController < ApplicationController
	
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy
	
	def index
		@users = User.paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id].to_i)
		@revenues = @user.revenues.paginate(page: params[:page])
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
					UserMailer.welcome_email(@user).deliver
			flash[:success] = "Bem vindo a Receitas Online!"
			redirect_to @user
		else
			render 'new'
		end
	end
	def edit
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Perfil Editado"
			redirect_to @user
		else
			render 'edit'
		end
	end
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "Usuario deletado."
		redirect_to users_url
	end
	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
	def signed_in_user
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Por favor Realize o Login."
		end
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end
	def admin_user
		redirect_to(root_url) unless current_user.admin?
	end
end
