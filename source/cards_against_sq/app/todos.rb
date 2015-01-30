require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

# This is the view! :)

# Create an instance of the controller
# Get information from ARGV
# Send that information to the controller
# Display pretty information

def clear_screen
  puts "\e[H\e[2J"
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

def display_all_lists(list)
  List.all.each {|list| puts "##{list.id} - #{list.name}"}
end

def display_task_list(list)
  puts "These are your tasks:"
  list.tasks.each {|task| display_task(task)}
end

def display_task(task)
  puts "(#{task.completed ? "X" : " "}) Task ##{task.id}, #{task.description}"
end

controller = Controller.new
controller.current_list = prompt_for_list

def do_task_commands(response)

  command = response[0]

  case command
  when 'add'
    description = response[1..-1].join(" ")
    controller.add_task(description)
  when 'delete'
    controller.delete(response[1].to_i)
  when 'complete'
    controller.complete(response[1].to_i)
  when 'switch'
    controller.switch_list(prompt_for_list)

  when 'exit'
    break
  end
end

def do_list_commands(response)
  command = response[0]
  id = response[1].to_i

  case command
  when "new"
    controller.add_list
  when "remove"


end






while true
  clear_screen

  print_commands
  puts ""
  controller.list


end
