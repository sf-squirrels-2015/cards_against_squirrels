require_relative 'config/application'

class Controller
  attr_accessor :game_over, :view, :players

  def initialize
    @view = View.new
    @game_over = false
    @players = []
  end

  def load_game
    reset
    4.times do
      @players << Player.create(name: Faker::Name.name, points: 0)
    end
  end

  def turn
    @view.show_hand(players[0].hand)
    read_black_card
    @view.read_card(card)
    cards_played = played_cards
    winning_card = pick_winning_card(cards_played)
    show_winner(winning_card)
    check_points
    players_draw if !@game_over

  end

  def reset
    BlackCard.all.each{|card| card.update_attributes(played: false, player_id: nil)}
    WhiteCard.all.each{|card| card.update_attributes(played: false, player_id: nil)}
    Player.all.each{|player| player.destroy}
  end

  def read_black_card
    @black_card = BlackCard.find_by(played: false, player_id: nil)
    @view.read_card(@black_card)
  end

  def played_cards
    played_cards = []
    played_cards << (WhiteCard.find(choose_card))
    @players.each_with_index do |player, index|
      if index != 0
        played_cards << player.hand.sample
      end
    end
    played_cards.each {|card| card.update_attributes( played: true )}
    @view.read_played(played_cards, @black_card)
    return played_cards
  end

  def pick_winning_card(played_cards)
    played_cards.sample
  end

  def show_winner(winning_card)
    @view.read_card(@black_card)
    @view.read_card(winning_card)
  end

  def check_points
    Player.all.each do |player|
      if player.winner?
        @game_over = true
        break
      end
    end
  end


  def players_draw
    Player.all.each do |player|
      player.draw_card
    end
  end


end

controller = Controller.new

controller.load_game

until controller.game_over == false
  turn
end

controller.reset


