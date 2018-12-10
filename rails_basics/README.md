# Rails 'Cheat-sheet'

This will ideally help students study for the App Academy A04 Rails Assessment. Please take all content with a grain of salt as I am also learning. Independently verify! And of course let me know if you see something incorrect.

* [Rails Setup][rails_setup]
* [Database][database]
* [Migrations][migrations]
* [Models][models]
* [Routes][routes]
* [Auth][auth]
* [Controllers][controllers]
* [Views][views]

## Making a Rails App Overview

* Start by understanding the table structure required, then build out migrations. If you need to go back and fix a migration later, no problem.
* Once migrated, make all the files needed for models and controllers. Run annotate to have that nice description on the model files.
* I like to do the basics on the models files next (validation and associations). It's stuff we were previously tested on so I find it easy to just get it out of the way.
* After that I make the routes and get Auth done, including the SessionsController and User model. Finally, fill in the various controllers and corresponding views.

## Files and Naming

In the below table, `one_item`, `many_items`, and `needed_view` are placeholders for whatever table name or view is needed. Mainly there to convey which things should be singular and which plural.

| Item | Use Case | Filename | Inside |
| --- | --- | --- | ------ |
| Migrations  | bash `be rails g migration MigrationName` | Automatically generated | `create_table :many_items` |
| Routes      | One file with one section for each table in the database | config/routes.rb | `resources :many_items, only: [.. :needed_view ..]` |
| Models      | One file for each table in the database | app/models/one_item.rb | `class OneItem < ApplicationRecord` |
| Controllers | One file for each table in the database (usually) | app/controllers/many_items_controller.rb | `class ManyItemsController < ApplicationController` |
| Views       | One file for each GET route | app/views/many_items/needed_view.html.erb |  |
| Partials    | As needed to DRY views | app/views/many_items/_dry_usecase.html.erb |  |

[rails_setup]: ./rails_setup/README.md
[database]: ./database/README.md
[migrations]: ./migrations/README.md
[models]: ./models/README.md
[routes]: ./routes/README.md
[controllers]: ./controllers/README.md
[views]: ./views/README.md
[auth]: ./auth/README.md
