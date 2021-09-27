# frozen_string_literal: true

class Bank
  attr_reader :money

  def initialize
    @money = 0
  end

  def add_bank(gamer)
    gamer.money -= 10
    @money = 20
  end
end
