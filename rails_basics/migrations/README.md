# Migrations

## New Migrations

* bash `be rails g migration MigrationName`
* Obviously be mnemonic instead of `MigrationName` though
* Using `CreateTablename` will prepopulate the create table code

## Create Table
```
create_table :table_name_plural_items do |t|
  t.string :text_field, null: false
  t.date :date_field, null: false
  t.integer :integer_field, null: false
  t.text :long_text_field

  t.timestamps
end
```

* Table names should be pluralized.
* `null: false` indicates that from the database's perspective, this field must be filled in
* Other options include:
  * `default: 'default_value'`
  * More..?
* Usually integer fields are associated with a foreign key
* Always include `t.timestamps`

## Indexes
#### (indices?)

From my understanding, add an index when you will be searching on the indexed field a lot. The database will add an additional sort by this field so it can find records in O(log(n)) time. Foreign keys are usually indexed.

`add_index :table_name, :field_name, unique: true`
* Include `unique: true` if you want the field to be unique (wow!)

`add_index :table_name, [:field_name, :other_field]`
* This indicates that `:field_name` and `:other_field` form a kind of key. There can be many occurrences of `:field_name` and many occurrences of `:other_field`, but only ONE occurrence of both together.
* Don't take my word on that just yet though...

## Modifying Tables

`add_column :table_name, :new_field_name, :string, null: false`
* Change `:string` to whatever you need
* Include `null: false` as needed. Be careful about adding this to a database that already has records in `:table_name`. You may need to clear data and re-seed.

`remove_column :table_name, :field_name`
* Pretty obvious!
