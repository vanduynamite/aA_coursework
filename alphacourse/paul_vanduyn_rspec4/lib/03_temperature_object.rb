class Temperature

  def initialize(options)
    if options[:f].nil?
      @celsius = options[:c].to_f
      @fahrenheit = to_fahrenheit(@celsius)
    else
      @fahrenheit = options[:f].to_f
      @celsius = to_celsius(@fahrenheit)
    end
  end

  def self.from_celsius(temp)
    Temperature.new(c:temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(f:temp)
  end

  def to_celsius(degrees_f)
    (degrees_f.to_f - 32) / 9 * 5
  end

  def to_fahrenheit(degrees_c)
    degrees_c.to_f * 9 / 5 + 32
  end

  def in_fahrenheit
    @fahrenheit
  end

  def in_celsius
    @celsius
  end

end

# Subclasses/Inheritance
class Celsius < Temperature

  def initialize(temp)
    super(c:temp)
  end

end

class Fahrenheit < Temperature

  def initialize(temp)
    super(f:temp)
  end

end
