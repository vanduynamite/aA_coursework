
class Cat
  # this is a constant that can be used by this class
  TYPES = [
    "tabby",
    "blue",
    "scottish fold",
    "whatever"
  ]

  # this will automatically generate getters and setters for this variable
  attr_accessor :age, :type

  # also useful:
  # attr_reader :var, :var2 # only makes the getters
  # attr_writer :var, :var2 # only makes the setters

  # constructor
  def initialize(name, age, type = "normal")
    # these are instance variables and you can tell because of the @
    @name = name
    @age = age
    @type = type
  end

  # these are called INSTANCE METHODS as they work on each instance of this class
  def meow
    p "#{@name} meows!"
  end

  def get_older(increment = 1)
    # these both work
    # self.age += 1
    @age += increment
    p "#{@name} just got one year older"
  end

  # getter, manually
  def name
    @name
  end

  # setter, manually
  def name=(value)
    @name = name
  end


  # this is called a CLASS METHOD
  def self.age_to_human_years(age)
    age * 5.5
  end

  # ths is a specific class method called a FACTORY METHOD
  def self.create_blue(name, age)
    Cat.new(name, age, "blue")
  end

  def self.create_random(name, age)
    Cat.new(name, age, TYPES.sample)
  end

end

# this is called "extending" or "monkey-strapping" a class
# this will be available to all Cat classes
class Cat

  def old?
    self.age >= 10
  end

end


# heidi is an INSTANCE of the cat class

heidi = Cat.new("Heidi", 7)

heidi.name = "Not Heidi"
heidi.name = "Heidi"

heidi.meow

p heidi.name
p "heidi's age is #{heidi.age}"

p "is heidi old? #{heidi.old?}"
heidi.get_older
p heidi.age

p Cat.age_to_human_years(heidi.age)

rory = Cat.create_blue("Rory", 6)
p rory.type
