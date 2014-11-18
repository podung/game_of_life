class Organism
  def initialize(initial_life_status)
    @alive = initial_life_status
  end

  def alive?
    @alive
  end

  def kill!
    @alive = false
  end

  def resurrect!
    @alive = true
  end

  def ==(o)
    o.class == self.class && o.alive? == alive?
  end
end

