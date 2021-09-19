# frozen_string_literal: true

class Gamer
  attr_reader :hand, :summa

  def initialize
    @hand = []
  end

  def give_card(deck)
    if @hand.size > 2
      puts 'BREAKING! Вы попытались взять больше 3 карт!'
    else
      @hand << deck.random_card
    end
  end

  def give_two_cards(deck)
    2.times do
      @hand << deck.random_card
    end
  end

  def summa_cards
    @summa = 0
    @hand.each do |card|
      @summa += card.value
    end
  end

  def info_cards
    puts "'#{self.class}' - ваши карты: "
    @hand.each { |card| puts "#{card.suit}'#{card.nominal}':*#{card.value}*" }
    puts "'#{self.class}' - сумма ваших карт равна: #{@summa}!"
  end
end
