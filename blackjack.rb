# frozen_string_literal: true

class Blackjack
  def self.call
    deck = Deck.new
    @bank = Money.new
    loop do
      print 'Введите ваше имя: '
      puts "#{gets.chomp} - добро пожаловать в игру 'Black Jack'!"
      puts '*------------------------------*'
      puts 'Введите 1 - для начала игры.'
      print 'Ваш ответ: '
      case gets.to_i
      when 1
        @player = Player.new
        @dealer = Dealer.new
        puts '*------------------------------*'
        puts 'ИГРА НАЧАЛАСЬ!'
        puts '*------------------------------*'
        @player.pay_player
        @dealer.pay_dealer
        @bank.add_bank
        puts 'Сделана ставки по 10$'
        puts '*------------------------------*'
        puts 'Раздаются карты для игрока...'
        @player.give_two_cards(deck)
        @player.summa_cards
        @player.info_cards
        puts '*------------------------------*'
        puts 'Раздаются карты для дилера...'
        @dealer.give_two_cards(deck)
        @dealer.summa_cards
        puts '********************************'
        puts '*------------------------------*'
        puts 'Какой ход вы выбираете? '
        puts 'Выберите 1 - если вы хотите пропустить ход!'
        puts 'Выберите 2 - если вы хотите добавить еще одну карту!'
        puts 'Выберите 3 - если вы хотите открыть карты!'
        print 'Ваш ответ: '
        case gets.to_i
        when 1
          puts '*------------------------------*'
          puts 'Игрок пропускаете ход!'
          puts '*------------------------------*'
          puts 'Дилер выбирает свой ход...'
          puts '*------------------------------*'
          delay
          @dealer.walk_dealer(deck)
          @dealer.summa_cards
          puts '*------------------------------*'
          puts 'Карты вскрываются...'
          puts '*------------------------------*'
          @player.info_cards
          puts '*------------------------------*'
          @dealer.info_cards
          puts '*------------------------------*'
          winning
          play
        when 2
          puts '*------------------------------*'
          puts 'Игроку добавляется одна карта!'
          puts '*------------------------------*'
          @player.give_card(deck)
          @player.summa_cards
          @player.info_cards
          puts '*------------------------------*'
          puts 'Дилер выбирает свой ход...'
          puts '*------------------------------*'
          delay
          @dealer.walk_dealer(deck)
          @dealer.summa_cards
          @dealer.info_cards
          puts '*------------------------------*'
          puts 'Карты вскрываются...'
          puts '*------------------------------*'
          winning
          play
        when 3
          puts '*------------------------------*'
          puts 'Карты вскрываются...'
          puts '*------------------------------*'
          delay
          puts '*------------------------------*'
          @player.info_cards
          puts '*------------------------------*'
          @dealer.info_cards
          puts '*------------------------------*'
          winning
          play
        end
      end
    end
  end

  def self.win_player
    @player.player_money += @bank.bank_money
  end

  def self.win_dealer
    @dealer.dealer_money += @bank.bank_money
  end

  def self.draw
    @player.player_money += 10
    @dealer.dealer_money += 10
  end

  def self.winning
    if @player.summa > 21
      puts 'Игрок проиграл из-за перебора карт!'
      win_dealer
    elsif @dealer.summa > 21
      puts 'Дилер проиграл из-за перебора карт!'
      win_player
    else
      checking
    end
  end

  def self.checking
    if @player.summa > @dealer.summa
      puts 'Игрок победил!'
      win_player
    elsif @dealer.summa > @player.summa
      puts 'Дилер победил!'
      win_dealer
    else
      puts 'Ничья!'
      draw
    end
  end

  def self.delay
    sleep 3
  end

  def self.play
    puts '*------------------------------*'
    puts 'Хотели бы вы сыграть снова? '
    puts 'Выберите 1 - для начала игры!'
    puts 'Выберите 2 - если хотите завершить игру!'
    print 'Ваш ответ: '
    case gets.to_i
    when 1
      call
    when 2
      puts '*------------------------------*'
      puts 'Вы завершили игру!'
      puts '*------------------------------*'
      exit
    end
  end
end
