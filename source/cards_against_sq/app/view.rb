require_relative 'config/application'
class View
  def welcome
    puts "    _   _   _   _   _     _   _   _   _   _   _   _     _   _   _   _   _   _   _   _   _
    / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ / \   / \ / \ / \ / \ / \ / \ / \ / \ / \
    ( C | a | r | d | s ) ( A | g | a | i | n | s | t ) ( S | q | u | i | r | r | e | l | s )
    \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/   \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ \_/ "
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def show_hand(card)
    puts "This is your hand"
    puts "***#{card.id}***"
    print ".--------------."
    puts " | #{card.text} |"
    print ",--------------,"
  # have index of each card
  # seperators to view cards in a block
  end

def read_card(card)
  if card.class == BlackCard
    puts "SQUIRREL HERE IS THE BLACK CARD\n"
  end
  print ".--------------."
  puts " | #{card.text} |"
  print ".--------------."
end

def read_played(played_cards, black_card)
  puts "SQUIRREL HERE IS WHAT WAS PLAYED"
  played_cards.each do |card|
    read_card(black_card)
    read_card(card)
  end
end

def choose_card
  puts "Enter the number of the card you would like to play\n"
  response = gets.chomp.to_i
  return response
end

end
controller = Controller.new
controller.current_list = prompt_for_list



#   while true
#     clear_screen
#     print_commands
#     puts ""
#     controller.list
#   end
# end

p welcome
