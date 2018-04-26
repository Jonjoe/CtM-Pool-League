class League < ApplicationRecord
    has_many :games 

    belongs_to :winner, class_name: "User", optional: true
    belongs_to :owner, class_name: "User"

    def assign_winner
        score_list_hash = self.games.all.group(:winner_id).count
        ordered_score_list_hash = Hash[score_list_hash.sort_by{|k, v| v}.reverse]


        self.winner_id = ordered_score_list_hash.values[0]
        self.save
    end 
end
