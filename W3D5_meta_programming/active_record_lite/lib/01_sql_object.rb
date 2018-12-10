require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns unless @columns.nil?

    results = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM #{self.table_name}
      LIMIT 0
    SQL

    @columns = results[0].map { |column| column.to_sym }
  end

  def self.finalize!

    self.columns.each do |column|

      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |new_value|
        self.attributes[column] = new_value
      end

    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name.nil? ? self.name.to_s.downcase.pluralize : @table_name
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    objects = []
    results.each { |record| objects << self.new(record) }
    objects
  end

  def self.find(id)
    self.all.each { |record| return record if record.id == id }
    nil
  end

  def initialize(params = {})

    params.each do |param, value|
      param = param.to_sym
      raise "unknown attribute '#{param}'" unless self.class.columns.include?(param)
      self.send("#{param}=", value)
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.attributes.values
  end

  def insert

    col_names = self.class.columns.drop(1).map { |col| col.to_s }.join(", ")
    question_marks = self.class.columns.drop(1).map { |_| "?" }.join(", ")
    # byebug
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO #{self.class.table_name} (#{col_names})
      VALUES (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id

  end

  def update
    col_names = self.class.columns.drop(1).map { |col| col.to_s }.join(", ")
    question_marks = self.class.columns.drop(1).map { |_| "?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE #{self.class.table_name}
      SET (#{col_names}) = (#{question_marks})
      WHERE #{self.class.table_name}.id = ?
    SQL
  end

  def save
    self.id.nil? ? self.insert : self.update
  end
end
