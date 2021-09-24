# frozen_string_literal: true

class Deck
  attr_reader :cards

  SUITS = %w[Kresti Cherv Pic Buben].freeze
  NOMINALS = %w[2 3 4 5 6 7 8 9 10 V D K A].freeze

  def initialize
    @cards = []
    SUITS.each do |suit|
      NOMINALS.each do |nominal|
        value = value_card(nominal)
        @cards << Card.new(suit, nominal, value)
      end
    end
    @cards.shuffle!
  end

  def value_card(nominal)
    return 10 if %w[V D K].include?(nominal)
    return 11 if nominal == 'A'

    nominal.to_i
  end

  def random_card
    @cards.pop
  end
end
