class SessionsController < ApplicationController
	def new
		@new_user = User.new
	end
	def create
		email =params[:user][:email]
		password = params[:user][:password]
		user =User.find_by(email: email)
		if user && user.authenticate(password)
			session[:user_id] = user.id
			flash[:success] = "Logged In"
			redirect_to root_path
		else
			@new_user=User.new(email:email)
			flash[:danger] = "wrong password"
			render "new"
		end
	end
	def destroy 
		session[:user_id] = nil
		flash[:success] = "Logged out"
		redirect_to login_path
	end
end