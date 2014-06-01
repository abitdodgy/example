class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to new_game_entry_path(@game)
    else
      render :new
    end
  end

private

  def game_params
    params.require(:game).permit(:name)
  end
end
