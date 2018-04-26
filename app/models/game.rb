class Game < ApplicationRecord
    belongs_to :league
    has_one :winner
    has_one :player1
    has_one :player2
end
