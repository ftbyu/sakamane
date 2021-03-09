class Admin::GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @analiyses = Analiysis.all
    @players = []
    @game.achivements.each do |achivement|
      @players << achivement.player
    end

  end

  def edit
    @analiyses = Analiysis.all
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @players = current_manager.players
  end

  def score
    @analiyses = Analiysis.all
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_managers_games_path
  end

  def create
    analiyses = Analiysis.all

    #試合を作成
    game = Game.new(game_params)
    game.manager_id = current_manager.id
    game.enemy_name = params[:game][:enemy_name]
    game.type_id = params[:game][:type_id]
    game.location_id = params[:game][:location_id]
    game.save!

    params[:game][:player_id].each do |player_id|
      #個人成績を作成
      achivement = game.achivements.new
      achivement.player_id = player_id
      achivement.save!

      #個人成績に紐ずく分析記録を作成
      analiyses.each do |analiysis|
        result = analiysis.results.new
        result.achivement_id = achivement.id
        result.amount = 0
        result.save!
      end
    end

    #試合のスコアを記録する画面へ遷移(score画面)
    redirect_to score_admin_managers_game_path(game.id)
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
    params.require(:game).permit(:enemy_score, :enemy_name, :location_id, :type_id, :player_id)
  end
end
