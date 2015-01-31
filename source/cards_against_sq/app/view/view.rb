require_relative '../../config/application'
class View
  def welcome
    clear_screen
    puts "
   _____              _                           _           _      _____             _               _
  / ____|            | |         /\\              (_)         | |    / ____|           (_)             | |
 | |     __ _ _ __ __| |___     /  \\   __ _  __ _ _ _ __  ___| |_  | (___   __ _ _   _ _ _ __ _ __ ___| |___
 | |    / _` | '__/ _` / __|   / /\\ \\ / _` |/ _` | | '_ \\/ __| __|  \\___ \\ / _` | | | | | '__| '__/ _ \\ / __|
 | |___| (_| | | | (_| \\__ \\  / ____ \\ (_| | (_| | | | | \\__ \\ |_   ____) | (_| | |_| | | |  | | |  __/ \\__ \\
  \\_____\\__,_|_|  \\__,_|___/ /_/    \\_\\__, |\\__,_|_|_| |_|___/\\__| |_____/ \\__, |\\__,_|_|_|  |_|  \\___|_|___/
                                       __/ |                                  | |
                                      |___/                                   |_|
    "
    puts "

       |               o         ,---.          |    o
       |,---.,---.,---..,---.    |---'.   .,---.|---..,---.,---.
---    ||---'`---.`---.||---'    |  \\ |   |`---.|   |||   ||   |
   `---'`---'`---'`---'``---'    `   ``---'`---'`   '``   '`---|
                                                           `---'

   ,---.o     |                  |    ,---.          |    o
   |---'.,---.|---.,---.,---.,---|    `---.,---.,---.|--- .,---.
---|  \\ ||    |   |,---||    |   |        |,---||   ||    ||   |
   `   ```---'`   '`---^`    `---'    `---'`---^`   '`---'``   '


   ,---.|              |    |               o    ,---.          |    o    |
   `---.|---.,---.,-.-.|---.|---.,---..    ,.    `---.,---.,---.|---..,---|
---    ||   |,---|| | ||   ||   |,---| \\  / |        |,---||    |   |||   |
   `---'`   '`---^` ' '`---'`   '`---^  `'  `    `---'`---^`---'`   '``---'


   |   |                    |        ,---.o
   |---|,---.,---.,---.,---.|---.    `---..,---.,---.,---.
---|   |,---||   ||   |,---||   |        ||`---.|   ||   |
   `   '`---^`   '`   '`---^`   '    `---'``---'`---'`   '

    "
sleep(3)
  puts <<-START
Steps:
1. Run squirrel_cards.rb
2. Your hand of seven white cards will be displayed
3. Computer will randomly pick a black card
4. You are asked to choose one card number from your hand of cards
5. Three other virtual players will also choose a card from their hand.
6. After 3 seconds, the winning card will be declared.
7. Displays the players current scores
8. The game will run until a player hits 5 points.
9. Displays the winner.
START
sleep(3)
clear_screen
end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def show_hand(hand)
    puts "*~" * 55
    puts "\nTHIS IS YOUR HAND OF WHITE CARDS:\n\n"
    hand.each do |card|
      puts "** #{card.id} ** #{card.text}"
      puts
    end
    puts
    puts
  end

  def read_card(card)
    if card.class == BlackCard
      puts "*~" * 55
      puts "\nSQUIRREL HERE IS THE BLACK CARD:\n"
    end
    puts card.text
  end

  def read_played(played_cards, black_card)
    clear_screen
    puts "SQUIRREL HERE IS WHAT WAS PLAYED:"
    read_card(black_card)
    played_cards.each do |card|
      puts
      read_card(card)
    end
  end

  def read_winner(winning_card,black_card)
    puts
    puts "Thinking..."
    sleep(3)
    puts
    puts "*~*~*~*~*AND THE WINNER IS :*~*~*~**~*~~*~"
    read_card(black_card)
    # puts "*~*~*~*~AND HERE IS THE ANSWER...*~*~*~*~"
    puts
    read_card(winning_card)
    puts
  end

  def choose_card
    puts "*~" * 55
    puts "\n\nEnter the number of the card you would like to play\n"
    response = gets.chomp.to_i
    return response
    clear_screen
  end

  def wrong_card
    puts "you can't play that card, please choose again"
  end

  def show_score(players)
    puts "*~" * 55
    puts "THE SCORE IS:"
    players.each {|player| puts "#{player.name}: #{player.points}" }
  end

  def winning_player(player)
    puts
    puts "*" * (18  + player.name.length)
    puts "WINNING PLAYER IS #{player.name}"
    puts "*" * (18  + player.name.length)

  end
end


