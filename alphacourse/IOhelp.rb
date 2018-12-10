
input = gets # this will get input from a user
# it will input as a string, and will include a \n
# as the user will have pressed enter

input = gets.chomp # this will break off the \n

print input # print will convert input to a string before it prints it
puts input # like print, but adds a new line after the input
p input # more simplified, puts " around most things
# but p also displays arrays as you'd expect

######################################
### actual input from a file #########
######################################

# this actually only gets the first line. Why do I care?
File.open("testIOfile.txt") do |f|
  first_line = f.gets.chomp
  puts first_line
end

puts "", "OK here is the better looping version:"
# ok this is more like it, iterate through each line in the file
File.foreach("testIOfile.txt") do |line|
  p line.chomp # yes it will read the \n
end

# read the file into one long string
# chomping won't work because they are all separate lines
contents = File.read("testIOfile.txt")
p contents

# read the file line by line into an array, but this will be un-chomped
contents = File.readlines("testIOfile.txt")
p contents

# not sure what this does, it's not very clear at all
# f = File.new("todos")
# f.each {|line| puts "#{f.lineno}: #{line}" }


######################################
######### output to a file ###########
######################################

# the argument "w" tells File that we want to write to it
# this will completely overwrite the existing file!!!
File.open("testIOfile.txt", "w") do |f|
  f.puts "1. an added line!"
  f.puts "2. another added line!"
  f.puts "a third one?"
end

# the argument "a" stands for append
File.open("testIOfile.txt", "a") do |f|
  f.puts "appended line!"
  f.puts "another appended line!"
end

# the above two examples will both close the file after opening for write
# every file that is opened with a block will auto-close

# here's what you have to do if not opening it with a block:
f = File.open("testIOfile.txt", "a")
f.puts "last appended line.. :("

f.close

######################################
######### standard IO ################
######################################

# the command line is just a standard I/O file?
# uses $stdin and $stdout? I dunno

# this will just keep reading until user presses enter
# then spits what the user typed

# $stdin.each do |input|
#   puts "I was given: #{ input }"
# end

# lastly, you can type a text file (or whatever) after a
# program file to have that text file used as input to the program

# so if someone runs this file as: "ruby IOhelp.rb testIOfile.txt"
# then ARGV will be an array containig the filename testIOfile.txt
puts ARGV

# supposedly
