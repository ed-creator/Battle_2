class Game
  attr_reader :players
  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end




  def self.create(player_1,player_2)
    @game = Game.new(player_1,player_2)
  end

  def self.instance
    @game
  end

  def healer
    @players.first
  end

  def receiver
    @players.last
  end

  def switch_players
    @players.reverse!
  end

  def validate(player)
    player.increase_hp
  end

  def game_over
    "#{healer.name} has won the game!" if winner?
  end

  def winner?
    healer.hp >= 20? true : false
  end
end
