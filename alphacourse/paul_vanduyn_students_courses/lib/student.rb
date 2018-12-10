require 'course'

class Student

  attr_accessor :first_name, :last_name, :courses

  def initialize(first_name, last_name)

    @first_name = first_name
    @last_name = last_name
    @courses = []

  end

  def name
    @first_name + " " + @last_name
  end

  def enroll(course)

    raise "conflict!" if @courses.any? { |old| course.conflicts_with?(old) }

    unless @courses.include?(course)
      @courses << course
      course.students << self
    end

  end

  def course_load()
    load_hash = Hash.new(0)
    @courses.each { |c| load_hash[c.department] += c.credits }
    load_hash
  end

end
