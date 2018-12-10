
simple_hash = {
  2 => "c",
  3 => "d",
  0 => "a",
  1 => "b",
}

p simple_hash
p simple_hash[2]  # => this the key not the 'index' (which doesn't even exist)
p simple_hash[40] # => nil

simple_hash[4] = "e"

p simple_hash

# mother fucking symbols what is this fucking shit about

a = :symbol

p a

# I guess symbols are a type of object? Like a string or an int or whatever
# But their identity stays the same no matter where it's called

a = "string"
b = "string"

c = :string
d = :string

p a.object_id # different from b
p b.object_id # different from a
p c.object_id # same as d
p d.object_id # same as c

# so we're going to use symbols to point to shit in our hash

cool_hash = {
  :fibs => [0, 1, 1, 2, 3, 5],
  :planets => ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'],
}

cooler_hash = {
  fibs: [0, 1, 1, 2, 3, 5],
  planets: ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'],
}
p cool_hash[:fibs]
p cooler_hash[:fibs]

p cooler_hash.keys
p cooler_hash.values
p cooler_hash.length
p cooler_hash.has_value?([0, 1, 1, 2, 3, 5])

p simple_hash.to_a

# counter hashes

# first let's make one with default value of 0

counter_hash = Hash.new(0)

# now we can increment a key that doesn't exist yet

counter_hash[:thing1] += 1

p counter_hash # it's 1 now
