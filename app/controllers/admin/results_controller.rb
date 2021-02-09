class Admin::ResultsController < ApplicationController

  def update
    result = Result.find(params[:id])
    result.update(result_params)
    redirect_to request.referer
  end

  def update_all
    achivements = Achivement.where(game_id: params[:game_id])
    achivements.each do |achivement|
      achivement.results.each do |result|
        result.update(result_params)
      end
    end
    redirect_to request.referer
  end

	private
	def result_params
    params.require(:result).permit(:amount)
  end
end
