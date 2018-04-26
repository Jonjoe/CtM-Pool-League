class HomeController < ApplicationController
  def index
    @ongoing_leagues = League.where(winner_id: nil).where(archived: false)
    @completed_leagues = League.where.not(winner_id: nil).where(archived: false)

    @top5_players = Game.get_top_5
  end
end
