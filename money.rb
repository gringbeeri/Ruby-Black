# frozen_string_literal: true

class Money
  attr_accessor :bank_money

  def initialize
    @bank_money = 0
  end

  def add_bank
    @bank_money = 20
  end
end
