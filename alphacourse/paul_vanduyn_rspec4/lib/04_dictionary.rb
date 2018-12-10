class Dictionary

  attr_accessor :entries, :keywords

  def initialize()
    @entries = {}
    @keywords = []
  end

  def add(new_entries)

    if new_entries.is_a?(String)

      @entries[new_entries] = nil
      @keywords << new_entries

      @keywords.sort!

    elsif new_entries.is_a?(Hash)

      new_entries.each do |k, v|
        @entries[k] = v
        @keywords << k

        @keywords.sort!

      end

    end
  end

  def include?(keyword)
    @keywords.include?(keyword)
  end

  def find(prefix)

    found = {}

    @entries.each { |k, v| found[k] = v if k[0...prefix.length] == prefix }

    found

  end

  def printable

    @keywords.map { |k| %Q([#{k}] "#{@entries[k]}")}.join("\n")

  end

end
