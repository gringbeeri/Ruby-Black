# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
# Service to download ftp files from the server
class Blackjack
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.call
    # rubocop:disable Metrics/BlockLength
    loop do
      print 'Введите ваше имя: '
      puts "#{gets.chomp} - добро пожаловать в игру 'Black Jack'!"
      puts '*------------------------------*'
      puts 'Введите 1 - для начала игры.'
      print 'Ваш ответ: '
      case gets.to_i
      when 1
        player = Player.new
        dealer = Dealer.new
        puts '*------------------------------*'
        puts 'ИГРА НАЧАЛАСЬ!'
        puts '*------------------------------*'
        puts 'Сделана ставки по 10$'
        pay_money
        puts '*------------------------------*'
        puts 'Раздаются карты для игрока...'
        player.two_random_cards
        player.info_cards
        puts '*------------------------------*'
        puts 'Раздаются карты для дилера...'
        dealer.two_random_cards
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
          dealer.walk_dealer
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
          player.random_cards
          player.info_cards
          puts '*------------------------------*'
          puts 'Дилер выбирает свой ход...'
          puts '*------------------------------*'
          delay
          dealer.walk_dealer
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
    # rubocop:enable Metrics/BlockLength
  end

  def self.pay_money
    Player.player_money -= 10
    Dealer.dealer_money -= 10
    Money.money_bank = 20
  end

  def self.win_player
    Player.player_money += Money.money_bank
  end

  def self.win_dealer
    Dealer.dealer_money += Money.money_bank
  end

  def self.dead_heat
    Player.player_money += 10
    Dealer.dealer_money += 10
  end

  def self.winning
    if Player.summa > 21
      puts 'Игрок проиграл из-за перебора карт!'
      win_dealer
    elsif Dealer.summa > 21
      puts 'Дилер проиграл из-за перебора карт!'
      win_player
    else
      checking
    end
  end

  def self.checking
    if Player.summa > Dealer.summa
      puts 'Игрок победил!'
      win_player
    elsif Dealer.summa > Player.summa
      puts 'Дилер победил!'
      win_dealer
    else
      puts 'Ничья!'
      dealer_money
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
      Player.summa = 0
      Dealer.summa = 0
      call
    when 2
      puts '*------------------------------*'
      puts 'Вы завершили игру!'
      puts '*------------------------------*'
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
# rubocop:enable Metrics/ClassLength
