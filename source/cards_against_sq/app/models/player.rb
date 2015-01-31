class Player < ActiveRecord::Base

  has_many :white_cards
  has_many :black_cards

  def create_initial_hand
    7.times do
      draw_card
    end
  end

  def draw_card
    card = WhiteCard.where(player_id: nil).sample
    card.update_attributes(player_id: self.id)
  end

  def hand
    WhiteCard.where(player_id: self.id, played: false)
  end

  def winner?
    self.points > 5
  end

end
