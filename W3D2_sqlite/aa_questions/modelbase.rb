require 'active_support/inflector'
require_relative 'questions_db'

class ModelBase

  def self.table_name
    self.to_s.tableize
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id: id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        id = :id
    SQL
    data.map { |datum| self.new(datum) }[0]
  end

  def self.all
    data = QuestionsDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    data.map { |datum| self.new(datum) }
  end


end
