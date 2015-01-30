class Player < ActiveRecord::Base

  has_many :white_cards
  has_many :black_cards

  def initialize
    7.times do
      draw_card
    end
  end

  def draw_card
    card = WhiteCards.find_by(player_id: nil)
    card.update_attributes(player_id: self.id)
  end

  def hand
    WhiteCards.where(player_id: self.id, played: false)
  end

  def winner?
    self.black_cards > 5
  end


end
