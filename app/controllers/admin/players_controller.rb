class Admin::PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
  	player = Player.find(params[:id])
    if player.update(player_params)
      flash[:notice] = "successfully"
  		redirect_to public_player_path(player)
    else
      flash[:notice] = "error"
      render :edit
    end
	end
	
	private
	def player_params
    params.require(:player).permit(:kana_name, :last_name ,:email)
  end
  
end
