class Player
  attr_reader :name, :hp
  STARTING_HP = 1

  def initialize(name)
    @name = name
    @hp = STARTING_HP
  end
  
  def increase_hp
    self.hp += 10
  end 

  private

  attr_writer :hp

end
