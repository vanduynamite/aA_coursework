# Database Interactions

## Rails Database Commands

These are all bash commands:

* `be rails db:setup` does all the setup for an inherited project, including initializing the database, running migrations, and seeding.
* `be rails db:create` will create the database if you're starting a rails project from scratch.
* `be rails db:migrate` to run all the migrations that haven't yet been run.
* `be rails db:seed` to run the seed file and populate the database.

## postgresql in terminal

These are all bash commands:

* `psql` to open postgres in the terminal
  * `\l` to list all databases that exist
  * `\q` to get out!
* `psql database_name` to open postgres into a specific database
  * `\d` to list all the relationships in that database
  * You can execute SQL queries right from terminal, don't forget to end in `;`

## Seed file

* `TableName.destroy_all` is a good idea to make sure no records persist.
* `TableName.create!(param: param_value...)` to create records. Use `!` otherwise it'll fail silently.
* It's a good idea to assign created records to variables so you can use them in future records where foreign keys are needed. For instance:
  * `user1 = User.create!(params)`
  * `cat1 = Cat.create!(owner: user1.id)`

## sqlite3

Maybe later..!
