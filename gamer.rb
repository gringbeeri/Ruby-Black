# frozen_string_literal: true

class Gamer
  attr_accessor :money
  attr_reader :hand

  def initialize
    @hand = []
    @money = 100
  end

  def give_card(deck)
    return puts 'Больше 3 карт!' if hand.size > 2

    @hand << deck.random_card
  end

  def sum
    sum_cards
    hand.map(&:value).sum
  end

  def give_two_cards(deck)
    3.times do
      give_card(deck)
    end
  end

  def info_cards
    puts "'#{self.class}' - ваши карты: "
    hand.each { |card| puts "#{card.suit}'#{card.nominal}':*#{card.value}*" }
    puts "'#{self.class}' - сумма ваших карт равна: #{sum}!"
  end

  protected

  def sum_cards
    sum = 0
    hand.each { |card| sum += card.value }
    hand.each do |card|
      if %(A).include?(card.nominal)
        card.value = (sum > 21 ? 1 : 11 )
        sum -= 11
        sum += card.value
      end
    end
  end
end
