class Character

  def initialize(x, y)
    raise NotImplementedError, 'You must implement the initialize method'
  end

  def draw
    raise NotImplementedError, 'You must implement the draw method'
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
