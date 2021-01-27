class Admin::ManagersController < ApplicationController
    
	def show
		@manager = Manager.find(params[:id])
	end

	def edit
    @manager = Manager.find(params[:id])
  end

  def update
  	manager = Manager.find(params[:id])
    if manager.update(manager_params)
      flash[:notice] = "successfully"
  		redirect_to admin_manager_path(manager)
    else
      flash[:notice] = "error"
      render :edit
    end
	end
	
	private
	def manager_params
    params.require(:manager).permit(:team_name, :email)
  end

end
