class League < ApplicationRecord
    has_many :games 

    belongs_to :winner, class_name: "User", optional: true
    belongs_to :owner, class_name: "User"
end
