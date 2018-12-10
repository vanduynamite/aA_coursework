class Timer

  attr_accessor :seconds

  def initialize
    @seconds = 0
    @minutes = 0
    @hours = 0
  end

  def seconds=(value)
    # if someone declares number of seconds, convert to hr, min, sec

    @seconds = value % 60
    @minutes = ((value - @seconds) % 3600) / 60
    @hours = (value - @seconds - 60 * @minutes) / 3600

  end

  def time_string
    "#{padder(@hours)}:#{padder(@minutes)}:#{padder(@seconds)}" 
  end

  def padder(num)
    if num > 9
      num.to_s
    else
      "0#{num.to_s}"
    end
  end


end
