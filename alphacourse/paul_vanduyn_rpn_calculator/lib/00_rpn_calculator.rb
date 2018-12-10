class RPNCalculator

  def initialize()
    @stack = []
  end

  def push(val)
    @stack << val.to_f
  end

  def plus
    calculator_empty if @stack.length < 2

    @stack = @stack[0...-2] << @stack[-2] + @stack[-1]

  end

  def minus
    calculator_empty if @stack.length < 2

    @stack = @stack[0...-2] << @stack[-2] - @stack[-1]

  end

  def times
    calculator_empty if @stack.length < 2

    @stack = @stack[0...-2] << @stack[-2] * @stack[-1]

  end

  def divide
    calculator_empty if @stack.length < 2

    @stack = @stack[0...-2] << @stack[-2] / @stack[-1]

  end

  def calculator_empty
    raise "calculator is empty"
  end


  def tokens(str)
    #returns an array of the numbers and operations in str

    symbols = {
      "+" => :+,
      "-" => :-,
      "*" => :*,
      "/" => :/,
    }

    str.split.map do |el|

      if symbols[el] != nil
        symbols[el]
      else
        el.to_f
      end

    end
  end

  def evaluate(str)

    tokens(str).each do |el|

      if el == :+
        self.plus
      elsif el == :-
        self.minus
      elsif el == :*
        self.times
      elsif el == :/
        self.divide
      else
        self.push(el)
      end

    end

    self.value

  end


  def value
    @stack.last
  end

end
