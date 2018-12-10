# Models

## File Format

* Create a model file for each table in your database.
* The filename should be (must be!) `single_item.rb` where `single_item` is the singular form of your table name.
* Inside the file, you should have a single class `class SingleItem < ApplicationModel`

After you run migrations and create all your model files, run bash `be annotate` to move the schema information for each table into the associated model file.

## Validations

While the database can check for presence of fields and uniqueness through indexes, we don't want to go all the way back to the database just to find an error. Here's some examples for syntax:

```
validates :field1, :field2, presence: true
validates :field1, uniqueness: true
validates :field3, inclusion: [array, of, values]
validates :field4, inclusion: [yes, no], if: -> { field4 }
```

You can write custom validations that will call a (typically private) method on this class to validate the field. This method should add to `errors` if something is amiss.

```
validate :method_name

  private

  def method_name
    errors[:this_error_name] if condition
  end
```


## Associations

Associations are necessary for ActiveRecord to have your tables interact in the expected manner. They are methods on a class that indicate to ActiveRecord how to write JOINs between the tables.

### belongs_to

Start with any file that has a foreign key. This is any field in the form of `field_id`. For every such field, you will have an association as follows:

```
belongs_to :mnemonic_thing,
  class_name: :OtherTable,
  foreign_key: :this_table_foreign_key_field
```

A real example with a field of `author_id` on the class `Book` would be something like:

```
belongs_to :author,
  class_name: :Author,
  foreign_key: :author_id
```

I dropped `primary_key: :id` because we should **always** has the primary key be `id`. Rails is smart enough to drop the `foreign_key` and `class_name` too if all the names match like in the above example. You can include another argument `optional: true` if the foreign key does not need to exist, otherwise it will automatically try to validate the presence of the field.

### has_many

Every `belongs_to` could have a corresponding `has_many` on the other table it's linking to. It may not **need** to, but it will likely be needed at some point, so it's good to add.

```
has_many :mnemonic_things,
  class_name: :OtherTable,
  foreign_key: :other_table_foreign_key_field
```

Real example, using the class `Author` and corresponding to the `Book` class from above:

```
has_many :books,
  class_name: :Book,
  foreign_key: :author_id
```

This is telling the `Author` class to go to the `Book` class and look for records where the `author_id` field on that class matches the `id` field on this `Author` class.

### has_one LIMIT

Sometimes instead of `has_many`, you will instead need a `has_one`. This is simply when the relationship calls for having only a single item related. I don't believe it stops you from actually having many, but the SQL query will `LIMIT 1`.

In the book example it certainly doesn't make sense. Maybe something like, employees are only allowed one computer. The `Computer` class has an `employee_id` that points to the `Employee`, and thus `belongs_to` an `:employee`. But if the `Employee` is only allowed a single computer, they would `has_one :computer` instead of `has_many`.

```
class Computer
  belongs_to :employee,
    class_name: :Employee,
    foreign_key: :employee_id
end

class Employee
  has_one :computer,
    class_name: :Computer,
    foreign_key: :employee_id
end
```

### has_one through

The other use for `has_one` is when you are joining through a table you already have an association with to find something on the other side. It's basically a `belongs_to through`. In our `Book / Author` example, let's say an `Author` can have a single publisher on the `publisher_id` field. The association would be as follows:

```
class Author
  belongs_to :publisher,
    class_name: :Company,
    foreign_key: :publisher_id
end
```

As a `Book` belongs to an `Author`, and now an `Author` belongs to a `:publisher`, it follows that each `Book` also has a publisher (AKA a `Company`). ActiveRecord finds out which one by looking **through** the `:author` association/method we defined earlier. The `has_one` and `source` need not match, though it makes sense in this example.

```
class Book
  has_one :publisher,
    through: :author,
    source: :publisher
end
```

### has_many through

On the other side of this, the `Company` has many `:employees` (which are actually `Authors`), and each `Author` has many `:books`. So it follows that each `Company` also has many books. I'm making weird word choices to prove that they don't always need to match!

```
class Company
  has_many :employees,
    class_name: :Author,
    foreign_key: :publisher_id

  has_many :published_books,
    through: :employees,
    source: :books
end
```

## Methods

Don't forget that this model file is a class just like any in ruby! It can have class methods, instance methods, constants, etc. like any other class.
