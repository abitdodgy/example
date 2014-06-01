class EntriesController < ApplicationController
  def show
    @entry = game.entries.find(params[:id])
  end

  def new
    @entry = game.entries.build
    @entry.groups.build
    @entry.groups.first.matches.build
  end

  def create
    @entry = game.entries.build(entry_params)
    if @entry.save
      redirect_to [game, @entry]
    else
      render :new
    end
  end

  def edit
    @entry = game.entries.find(params[:id])
  end

  def update
    @entry = game.entries.find(params[:id])
    if @entry.update(entry_params)
      redirect_to [game, @entry]
    else
      render :edit
    end
  end

private

  def game
    @game ||= Game.find(params[:game_id])
  end

  def entry_params
    params.require(:entry).permit(:name, groups_attributes: [:id, :name, matches_attributes: [:id, :name]])
  end
end
