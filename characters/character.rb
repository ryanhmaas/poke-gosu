class Character

  def initialize
    raise NotImplementedError, 'You must implement the initialize method'
  end

  def create
    raise NotImplementedError, 'You must implement the create method'
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def get_sprite
    raise NotImplementedError, 'You must implement the get sprite method'
  end

  def get_x
    raise NotImplementedError, 'You must implement the get x method'
  end

  def get_y
    raise NotImplementedError, 'You must implement the get y method'
  end
end
