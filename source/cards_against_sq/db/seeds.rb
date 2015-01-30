require_relative 'config/application'

def populate_white_cards
  white_cardsd= []
  file = File.open('wcards.txt', 'r') do |file|
      while line = file.gets
        white_cards << line
      end
  end
  white_cards.each {|card| WhiteCard.create(text: card) }
end


def populate_black_cards
  black_cards= []
  file = File.open('bcards.txt', 'r') do |file|
      while line = file.gets
        black_cards << line
      end
  end
  black_cards.each {|card| BlackCard.create(text: card) }
end

populate_white_cards
populate_black_cards

