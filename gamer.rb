# frozen_string_literal: true

class Gamer
  attr_accessor :money, :sum
  attr_reader :hand

  def initialize
    @hand = []
    @money = 100
  end

  def give_card(deck)
    return puts 'Больше 3 карт!' if hand.size > 2

    @hand << deck.random_card
  end

  def give_two_cards(deck)
    2.times do
      give_card(deck)
    end
  end

  def sum_cards
    @sum = 0
    hand.each { |card| @sum += card.value }
  end

  def info_cards
    puts "'#{self.class}' - ваши карты: "
    hand.each { |card| puts "#{card.suit}'#{card.nominal}':*#{card.value}*" }
    puts "'#{self.class}' - сумма ваших карт равна: #{sum}!"
  end

  def ace
    hand.each do |card|
      if %(A).include?(card.nominal)
        @sum -= 11
        card.value = (sum >= 11 ? 1 : 11)
      end
    end
  end
end
