class Triangle
  attr_reader :sides
  def initialize sides
    raise ArgumentError, "Argument is not an Array" unless sides.is_a? Array
    @sides = sides
  end

  def perimeter
    #@sides[0] + @sides[1] + @sides[2]
    @sides.reduce :+
  end

  def equilateral?
    sides[0] == sides[1] && sides[1] == sides[2]
  end

end


