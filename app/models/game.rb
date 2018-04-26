class Game < ApplicationRecord
    belongs_to :league

    belongs_to :winner, class_name: "User", optional: true
    belongs_to :player1, class_name: "User"
    belongs_to :player2, class_name: "User"

    def self.get_top_5
        self.get_all_scores.first(5)
    end

    def self.get_all_scores
        scores_hash = Game.all.group(:winner_id).count
        sorted_scores_hash = Hash[scores_hash.except(nil).sort_by{|k, v| v}.reverse]

        pp "------------------"
        pp scores_hash.except(nil)
        pp "------------------"
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
