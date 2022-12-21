class EmployeesController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index()
		@employees = Employee.all
	end

	private def employee_params
		params.require(:employee).permit(:fname, :lname, :email, :birthday, :office_id, employee_tag_ids: [])
	end
	
	def create()
		# employee_params = params.require(:employee).permit(:fname, :lname, :email, :birthday)
		@employee = Employee.create(employee_params)
		if @employee.valid?
			@employee.save!
			redirect_to employees_path
		else
			render 'new'
		end
	end
	def new()
		@employee = Employee.new	
	end
	def edit()
		@employee= Employee.find(params[:id])	
	end
	def show()
		@employee= Employee.find(params[:id])	 
	end
	def update()
		@employee= Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to employees_path
		else
			render 'edit'
		end
		
	end

	def destroy()
		@employee= Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path	
	end


end