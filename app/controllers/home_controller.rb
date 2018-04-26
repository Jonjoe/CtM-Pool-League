class HomeController < ApplicationController
  def index
    if signed_in? then
      @ongoing_leagues = League.where(owner: current_user)
    else 
      @ongoing_leagues = League.where(winner: nil).where(archived: false)
    end 
    
    @top5_players = Game.get_top_5
  end
end
