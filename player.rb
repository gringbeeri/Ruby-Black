# frozen_string_literal: true

class Player < Gamer
  attr_accessor :player_money

  def initialize
    super
    @player_money = 100
  end

  def pay_player
    @player_money -= 10
  end
end
