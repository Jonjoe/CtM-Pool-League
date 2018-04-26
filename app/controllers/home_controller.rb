class HomeController < ApplicationController
  def index
    @ongoing_leagues = League.where(winner_id: nil)
    @completed_leagues = League.where.not(winner_id: nil)

    score_list_hash = Game.all.group(:winner_id).count
    @players_scores = Hash[score_list_hash.sort_by{|k, v| v}.reverse]

    # Grab every game
    # Group by winner
    # count each group
  end
end
