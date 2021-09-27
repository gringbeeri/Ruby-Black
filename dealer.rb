# frozen_string_literal: true

class Dealer < Gamer
  def walk_dealer(deck)
    sum < 17 ? give_card(deck) && puts('Дилер берет еще одну карту!') : (puts 'Дилер пропускает ход!')
  end
end
