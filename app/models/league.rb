class League < ApplicationRecord
    has_many :games 

    belongs_to :winner, class_name: "User", optional: true
    belongs_to :owner, class_name: "User"

    def assign_winner
        self.winner_id = self.scores.values[0]
        self.save
    end 

    def scores
        scores_hash = self.games.all.group(:winner_id).count
        return Hash[scores_hash.sort_by{|k, v| v}.reverse]
    end 
end
