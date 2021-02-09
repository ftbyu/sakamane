class Admin::GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def new
    @game_new = Game.new
  end

  def score
    @achivements = Achivement.where(game_id: params[:id])
    @analiyses = Analiysis.all
    @game = Game.find(params[:id])
  end

  def create
    analiyses = Analiysis.all

    #試合を作成
    game = Game.new(game_params)
    game.save

    current_manager.players.each do |player|
      #個人成績を作成
      achivement = game.achivements.new
      achivement.player_id = player.id
      achivement.save

      #個人成績に紐ずく分析記録を作成
      analiyses.each do |analiysis|
        result = analiysis.results.new
        result.achivement_id = achivement.id
        result.amount = 0
        result.save
      end
    end

    #試合のスコアを記録する画面へ遷移(score画面)
    redirect_to score_admin_managers_game_path(game.id)
  end

  def completed
  end

  def update
  	game = Game.find(params[:id])
    if game.update(game_params)
      flash[:notice] = "successfully"
  		redirect_to request.referer
    else
      flash[:notice] = "error"
      render :edit
    end
	end
	
	private
	def game_params
    params.require(:game).permit(:enemy_score, :enemy_name, :location_id, :type_id)
  end
end
