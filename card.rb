# frozen_string_literal: true

class Card
  attr_accessor :value
  attr_reader :suit, :nominal

  def initialize(suit, nominal, value)
    @suit = suit
    @nominal = nominal
    @value = value
  end
end
