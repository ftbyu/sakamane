class Admin::ResultsController < ApplicationController

  def update
    result = Result.find(params[:id])
    result.update(result_params)
    redirect_to request.referer
  end

	private
	def result_params
    params.require(:result).permit(:amount)
  end
end
