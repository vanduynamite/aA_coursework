require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = options[:foreign_key]
    @primary_key = options[:primary_key]
    @class_name = options[:class_name]

    @foreign_key ||= "#{name}_id".to_sym
    @primary_key ||= :id
    @class_name ||= name.to_s.camelcase
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = options[:foreign_key]
    @primary_key = options[:primary_key]
    @class_name = options[:class_name]

    @foreign_key ||= "#{self_class_name.downcase}_id".to_sym
    @primary_key ||= :id
    @class_name ||= name.to_s.singularize.camelcase
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    ops = BelongsToOptions.new(name, options)

    define_method(name) do
      foreign_key_value = self.send(ops.foreign_key)
      ops.model_class.where({ops.primary_key => foreign_key_value}).first
    end

  end

  def has_many(name, options = {})
    ops = HasManyOptions.new(name, self.to_s, options)

    define_method(name) do
      primary_key_value = self.send(ops.primary_key)
      ops.model_class.where({ops.foreign_key => primary_key_value})
    end

  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
end
