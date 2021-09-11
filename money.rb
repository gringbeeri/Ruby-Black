# frozen_string_literal: true

# Service to download ftp files from the server
class Money
  @money_bank = 0

  class << self
    attr_accessor :money_bank
  end
end
