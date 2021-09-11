# frozen_string_literal: true

# Service to download ftp files from the server
module Cards
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  # Service to download ftp files from the server
  module ClassMethods
    attr_accessor :deck, :summa

    # rubocop:disable Metrics/MethodLength
    def deck_cards
      @deck = {
        'V+': 10, 'V<3': 10, 'V^': 10, 'V<>': 10,
        'D+': 10, 'D<3': 10, 'D^': 10, 'D<>': 10,
        'K+': 10, 'K<3': 10, 'К^': 10, 'К<>': 10,
        'A+': 10 || 1, 'A<3': 10 || 1, 'A^': 10 || 1, 'A<>': 10 || 1,
        Kresti2: 2, Kresti3: 3, Kresti4: 4, Kresti5: 5, Kresti6: 6,
        Kresti7: 7, Kresti8: 8, Kresti9: 9, Kresti10: 10, Cherv2: 2,
        Cherv3: 3, Cherv4: 4, Cherv5: 5, Cherv6: 6, Cherv7: 7,
        Cherv8: 8, Cherv9: 9, Cherv10: 10, Pic2: 2, Pic3: 3,
        Pic4: 4, Pic5: 5, Pic6: 6, Pic7: 7, Pic8: 8, Pic9: 9,
        Pic10: 10, Buben2: 2, Buben3: 3, Buben4: 4, Buben5: 5,
        Buben6: 6, Buben7: 7, Buben8: 8, Buben9: 9, Buben10: 10
      }
    end
    # rubocop:enable Metrics/MethodLength

    def summa_cards
      @summa = 0
    end
  end

  # Service to download ftp files from the server
  module InstanceMethods
    attr_reader :cards

    def cards_player
      @cards = []
      self.class.summa
    end

    def all_cards
      self.class.deck
    end

    def random_cards
      if @cards.size > 2
        puts 'BREAKING! Вы попытались взять больше 3 карт!'
      else
        random_card
      end
    end

    def two_random_cards
      2.times do
        random_cards
      end
    end

    def info_cards
      puts "'#{self.class}' - ваши карты: "
      puts @cards
      puts "'#{self.class}' - сумма ваших карт равна: #{self.class.summa}!"
    end

    protected

    def random_card
      card = self.class.deck.keys[rand(all_cards.size)]
      self.class.summa += self.class.deck[card]
      @cards << card
      self.class.deck.delete(card)
    end
  end
end
