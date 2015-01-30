require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

# This is the view! :)
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
    print ".--------------."
    puts " | #{card.text} |"
    print ",--------------,"
  # have index of each card
  # seperators to view cards in a block
  end

  def read_card(card)
    puts "This is your hand"
    print ".--------------."
    puts " | #{card.text} |"
    print ".--------------."
  end

  def choose_card

  end

  def print_task_commands
  puts 'Here are your Tasks:'
  puts 'Please choose a command:'
  puts "Type 'add' to add a task"
  puts "Enter 'delete' and a task # to remove a task"
  puts "Enter 'complete' and a task # to mark a task as completed"
  puts "Type exit to leave"
  response = gets.chomp.split(' ')
  do_task_commands(response)
  end

  def print_list_command
  puts "Here are your Lists"
  puts 'Please choose a command:'
  puts "Type 'new' to add a new list"
  puts "Enter 'remove' and a list # to remove a list"
  puts "Enter 'select' and a list # to select a list"
  puts "Type exit to leave"
  response = gets.chomp.split(' ')
  do_list_commands(response)
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
