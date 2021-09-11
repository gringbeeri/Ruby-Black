# frozen_string_literal: true

# Service to download ftp files from the server
class Player
  include Cards

  deck_cards
  summa_cards

  @player_money = 100

  class << self
    attr_accessor :player_money
  end

  def initialize
    cards_player
  end
end
