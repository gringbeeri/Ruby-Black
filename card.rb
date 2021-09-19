# frozen_string_literal: true

class Card
  attr_reader :suit, :nominal, :value

  def initialize(suit, nominal, value)
    @suit = suit
    @nominal = nominal
    @value = value
  end
end
