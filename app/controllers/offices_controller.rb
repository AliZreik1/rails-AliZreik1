class OfficesController < ApplicationController
	include PaginateConcern

	skip_before_action :verify_authenticity_token
	def index()
		@offices = paginate Office.order(floor: :asc)	
	end

	private def office_params
		params.require(:office).permit(:building, :floor, :number)
	end
	
	def create()
		# office_params = params.require(:office).permit(:fname, :lname, :email, :birthday)
		@office = Office.create(office_params)
		if @office.valid?
			@office.save!
			redirect_to offices_path
		else
			render 'new'
		end
	end
	def new()
		@office = Office.new	
	end
	def edit()
		@office= Office.find(params[:id])	
	end
	def show()
		@office= Office.find(params[:id])	 
	end
	def update()
		@office= Office.find(params[:id])
		if @office.update(office_params)
			redirect_to offices_path
		else
			render 'edit'
		end
		
	end

	def destroy()
		@office= Office.find(params[:id])
		@office.destroy
		redirect_to offices_path	
	end


end