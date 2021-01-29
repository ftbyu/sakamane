class Admin::GamesController < ApplicationController

  def index
    @games = Game.all
    @game_new = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    game = Game.new(game_params)
    game.save
    redirect_to admin_mabnagers_games_path
  end

  def update
  	game = Game.find(params[:id])
    if game.update(game_params)
      flash[:notice] = "successfully"
  		redirect_to admin_game_path(game)
    else
      flash[:notice] = "error"
      render :edit
    end
	end
	
	private
	def game_params
    params.require(:game).permit(:enemy_score, :enemy_image_id)
  end
end
