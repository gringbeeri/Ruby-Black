# frozen_string_literal: true

# Service to download ftp files from the server
class Dealer
  include Cards

  deck_cards
  summa_cards

  @dealer_money = 100

  class << self
    attr_accessor :dealer_money
  end

  def initialize
    cards_player
  end

  def walk_dealer
    self.class.summa < 17 ? random_cards && puts('Дилер берет еще одну карту!') : (puts 'Дилер пропускает ход!')
  end
end
