class League < ApplicationRecord
    has_many :games 

    belongs_to :winner, class_name: "User", optional: true
    belongs_to :owner, class_name: "User"

    def assign_winner
        self.winner_id = self.scores[0][:user].id
        self.save
    end 

    def every_game_complete
        self.games.each do |game|
            unless game.winner_id
                return false
            end
        end 
        
        return true 
    end 

    def scores
        if self.every_game_complete then
            scores_hash = self.games.all.group(:winner_id).count
            sorted_scores_hash = Hash[scores_hash.sort_by{|k, v| v}.reverse].to_a

            scores_array = []

            sorted_scores_hash.each do |score|
                scores_array.push({
                    user: User.find(score[0]), 
                    total: score[1]
                })
            end

            return scores_array
        end
    end 
end
