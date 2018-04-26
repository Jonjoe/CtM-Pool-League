class HomeController < ApplicationController
  def index
    if current_user then
      if current_user then
        leagues = League.where(owner: current_user)
      else
        leagues = League
      end 

      @ongoing_leagues = leagues.where(winner: nil).where(archived: false)
    end 

    @top5_players = Game.get_top_5
  end
end
