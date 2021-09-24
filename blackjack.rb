# frozen_string_literal: true

class Blackjack
  attr_reader :deck, :bank, :player, :dealer

  def call
    @deck = Deck.new
    @bank = Bank.new
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
        bank.add_bank(player)
        bank.add_bank(dealer)
        puts 'Сделана ставки по 10$'
        puts '*------------------------------*'
        puts 'Раздаются карты для игрока...'
        player.give_two_cards(deck)
        player.sum_cards
        player.ace
        player.sum_cards
        player.info_cards
        puts '*------------------------------*'
        puts 'Раздаются карты для дилера...'
        dealer.give_two_cards(deck)
        dealer.sum_cards
        dealer.ace
        dealer.sum_cards
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
          dealer.walk_dealer(deck)
          dealer.sum_cards
          dealer.ace
          dealer.sum_cards
          puts '*------------------------------*'
          puts 'Карты вскрываются...'
          puts '*------------------------------*'
          player.info_cards
          puts '*------------------------------*'
          dealer.info_cards
          puts '*------------------------------*'
          winning
          play
        when 2
          puts '*------------------------------*'
          puts 'Игроку добавляется одна карта!'
          puts '*------------------------------*'
          player.give_card(deck)
          player.sum_cards
          player.ace
          player.sum_cards
          player.info_cards
          puts '*------------------------------*'
          puts 'Дилер выбирает свой ход...'
          puts '*------------------------------*'
          delay
          dealer.walk_dealer(deck)
          dealer.sum_cards
          dealer.ace
          dealer.sum_cards
          dealer.info_cards
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
          player.info_cards
          puts '*------------------------------*'
          dealer.info_cards
          puts '*------------------------------*'
          winning
          play
        end
      end
    end
  end

  def win_player
    player.money += bank.money
  end

  def win_dealer
    dealer.money += bank.money
  end

  def draw
    player.money += 10
    dealer.money += 10
  end

  def winning
    if player.sum > 21
      puts 'Игрок проиграл из-за перебора карт!'
      win_dealer
    elsif dealer.sum > 21
      puts 'Дилер проиграл из-за перебора карт!'
      win_player
    else
      checking
    end
  end

  def checking
    if player.sum > dealer.sum
      puts 'Игрок победил!'
      win_player
    elsif dealer.sum > player.sum
      puts 'Дилер победил!'
      win_dealer
    else
      puts 'Ничья!'
      draw
    end
  end

  def delay
    sleep 3
  end

  def play
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
