class Book


  def initialize
    @title = ""
  end

  def title
    @title
  end

  def title=(name)

    excluded_words = [
      'the',
      'a',
      'an',
      'and',
      'in',
      'of',
    ]

    @title = name.split.map.with_index do |word, i|

      if excluded_words.include?(word) && i != 0
        word
      else
        word.capitalize
      end

    end.join(' ')

  end

end
