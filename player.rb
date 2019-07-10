class Player

  def initialize(number)
    @number = number
    @life = 3
  end

  attr_accessor :number, :life, :active
end