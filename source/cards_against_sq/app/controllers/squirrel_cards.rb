class Controller
  attr_accessor :game_over, :view, :players

  def initialize
    @view = View.new
    @game_over = false
    @players = []
  end

  def load_game
    4.times do
      @players << Player.new
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
    #resets all cards back to false
  end

  def read_black_card
    @black_card = #get a black card
    @view.read_card(@black_card)
  end

  def played_cards
    played_cards = []
    played_cards << (gets_card_from_view)
    #choose 1 random card from each player, push into played_card
    #needs to set played to false on played_cards.each
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


