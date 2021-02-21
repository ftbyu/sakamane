class Admin::AchivementsController < ApplicationController

  def show
    @achivement = Achivement.find_by(game_id: params[:game_id],player_id: params[:player_id])
  end

  def edit
    @achivement = Achivement.includes(:results).find(params[:id])
  end

  def update
    achivement = Achivement.find_by(game_id: params[:game_id],player_id: params[:player_id])
    ActiveRecord::Base.transaction do
      achivement.update_attributes!(achivement_params)
      Result.multi_update(results_params)
    end
    redirect_to request.referer
  end

  private
  def achivement_params
    params.require(:achivement).permit(:comment)
  end
  def results_params
    params.require(:achivement).permit(results: :amount)[:results]
  end
end
