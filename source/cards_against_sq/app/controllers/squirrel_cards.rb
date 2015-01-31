require_relative '../../config/application'
require 'debugger'
class Controller
  attr_accessor :game_over, :view, :players

  def initialize
    @view = View.new
    @game_over = false
    @players = []
  end

  def load_game
    @view.welcome

    # debugger
    reset
    4.times do
      @players << Player.create(name: Faker::Name.name, points: 0)
    end
    @players.each {|player| player.create_initial_hand }
  end

  def turn
    # @view.clear_screen
    @view.show_hand(players[0].hand)
    read_black_card
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
    @black_card = BlackCard.where(played: false, player_id: nil).sample
    @view.read_card(@black_card)
  end

  def played_cards
    played_cards = []
    choosen_card_id = @view.choose_card
    if @players[0].hand.any? {|card| card.id == choosen_card_id }
      played_cards << (WhiteCard.find(choosen_card_id))
    else
      @view.wrong_card
      played_cards()
    end
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
    @view.read_winner(winning_card, @black_card)
    @black_card.update_attributes(player_id: winning_card.player_id)
    winning_player = @players.find{ |player| player.id == winning_card.player_id}
    winning_player.update_attributes(points: (winning_player.points + 1))
  end

  def check_points
    @view.show_score(@players)
    @players.each do |player|
      if player.winner?
        @game_over = true
        @view.winning_player(player)
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
controller.turn

until controller.game_over == true
  sleep(7)
  controller.view.clear_screen
  controller.turn

  sleep(10)
end
