class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    return 13.hash if self.empty?

    sum = 0

    self.each.with_index do |el, i|
      if el.is_a?(Fixnum) || el.is_a?(Float)
        sum += el * (i + 13)
      elsif el.is_a?(String)
        sum += el.hash * (i + 14)
      elsif el.is_a?(Array)
        sum += el.hash * (i + 15)
      elsif el.is_a?(Hash)
        sum += el.hash * (i + 16)
      end
    end

    sum.hash
  end
end

class String
  def hash
    sum = 0

    if self.empty?
      sum += 0.1
    elsif self.length > 1
      sum += self.chars.hash + 1
    else
      sum += self.ord + 0.1
    end

    sum.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # return 0.5 if hash.empty?

    sum = 0.5

    self.each do |k, v|
      sum += k.hash * v.hash
    end

    sum.hash
  end
end
