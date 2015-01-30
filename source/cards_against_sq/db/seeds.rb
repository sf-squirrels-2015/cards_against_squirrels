require_relative '../config/application'

# puts "*" * 100

def populate_white_cards
  file = File.open("wcards.txt", "r")
  white_cards = file.map {|line|  line.chomp }
  white_cards.each {|card| WhiteCard.create(text: card) }
end


def populate_black_cards
  file = File.open("bcards.txt", "r")
  black_cards= file.map { |line| line.chomp }
  black_cards.each {|card| BlackCard.create(text: card) }
end

populate_white_cards
populate_black_cards

