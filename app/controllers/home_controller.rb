class HomeController < ApplicationController
  def index
    @ongoing_leagues = League.where(user_id: nil)
    @completed_leagues = League.where.not(user_id: nil)

    @players_scores = Games.all.group(:winner).count

    # Grab every game
    # Group by winner
    # count each group
  end
end
