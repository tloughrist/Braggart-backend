class PlayerMatch < ActiveRecord::Base
    belongs_to :match
    belongs_to :player
    belongs_tO :game, through: :match
end