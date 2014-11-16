class Organism
  def initialize
    @alive = true
  end

  def alive?
    @alive
  end

  def kill!
    @alive = false
  end
end

