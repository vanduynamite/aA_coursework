class Fixnum

FIXED = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
}

  def in_words

    if self == 0
      return "zero"
    end

    arr = []

    # go down each set of segments, tril, bil, mil, thou
    # cut off that section and stuff it in with its operator

    segments = build_segments

    segments.each do |val, label|
      arr.concat(hundreds(get_segment(val)))
      arr << label unless get_segment(val) == 0
    end

    arr.join(' ').strip

  end

  def hundreds(num)
    return [] if num == 0

    arr = []

    hundreds_digit = get_digit(num, 2)

    if hundreds_digit != 0
      arr << FIXED[hundreds_digit]
      arr << "hundred"
    end

    arr.concat(tens(num - hundreds_digit * 100))

  end

  def tens(num)
    return [] if num == 0

    arr = []

    if num < 20
      arr << FIXED[num]
    else
      arr << FIXED[num - num % 10]
      arr.concat(ones(num % 10))
    end

  end

  def ones(num)
    return [] if num == 0

    [FIXED[num]]
  end


  def get_segment(segment)
    if segment == 0
      self % 1000
    else
      (self - self % segment) % (segment * 1_000) / segment
    end
  end

  def get_digit(num, digit)
    # 0 to 2, otherwise use get_segment
    ((num - num % 10 ** digit) % 10 ** (digit + 1)) / 10 ** digit
  end

  def build_segments
    arr = []

    arr << [1_000_000_000_000, "trillion"]
    arr << [1_000_000_000, "billion"]
    arr << [1_000_000, "million"]
    arr << [1_000, "thousand"]
    arr << [0, ""]

  end

end
