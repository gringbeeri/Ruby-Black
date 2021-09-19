# frozen_string_literal: true

class Dealer < Gamer
  attr_accessor :dealer_money

  def initialize
    super
    @dealer_money = 100
  end

  def pay_dealer
    @dealer_money -= 10
  end

  def walk_dealer(deck)
    @summa < 17 ? give_card(deck) && puts('Дилер берет еще одну карту!') : (puts 'Дилер пропускает ход!')
  end
end
