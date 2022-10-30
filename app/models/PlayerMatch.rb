class PlayerMatch < ActiveRecord::Base
    belongs_to :match
    belongs_to :player
    belongs_to :game, through: :match
end