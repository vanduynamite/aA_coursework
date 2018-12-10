require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)

    where_clause = ""
    values = []

    params.map do |param, value|
      where_clause += param.to_s + " = ? AND "
      values << value
    end

    where_clause = where_clause[0...-5]

    results = DBConnection.execute(<<-SQL, *values)
      SELECT *
      FROM #{self.table_name}
      WHERE #{where_clause}
    SQL

    results.map! { |record| self.new(record) }
  end
end

class SQLObject
  extend Searchable
end
