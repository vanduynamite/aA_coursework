# Routes

Routes send a visitor to your site to the correct method by looking at the URL visited. You can find out which routes your project has at any time with:

```
be rails routes
```

Make changes to your routes file at `config/routes.rb`

## Resources

Add a list of routes for a specific model at once with:

`resources :models_plural, only: [:index, :show, :new, :create, :edit, :update, :destroy]`

In this example, all the basic routes are listed, but you can limit to only the ones you want by, you know, not including them.

For each route, there needs to be a corresponding method in `ModelsPluralController`.

## Session

Session is a special route that controls when a user is logged in. Careful with the plurality on this one, it's weird.

```
resource :session, only: [:new, :create, :destroy]
```

As far as I can tell, we should only have the above three actions on the `SessionsController`. Yes, the controller is plural, don't ask me.

## Nested Resources

Nest routes to create a longer URL that kind of takes advantage of the associations in your data.

```
resources :users do
  resources :things, only: [:create]
end
```

The URL for this will look like `/users/:id/things` which indicates to the controller to only mess with the `things` that `belong_to` the user with `id = :id`. This does not happen automatically, but at least that `:id` is available on the controller.

By default, a nested resource gets the `member`...tag? Keyword? I don't know what to call it. But, it means that the nested route will have that `/:id/` included. The other option is `collection`, which will produce a URL like `users/things`.

I'm a little shaky on nested resources, ok!

## Verbs

`GET`
* These are the only types of sites directly accessible from a web browser's URL. It's GETting a webpage to show you.
* Both `index` and `show` actions are `GET` requests, but only `show` has an `/:id` associated, indicating you are viewing a single record.
* Similarly, `new` does not have an `/:id` while `edit` does, again indicating that you dealing with a single record.
* `new` and `edit` are `GET` requests because you're not actually creating/editing anything yet. They should display a form that routes to the corresponding `create` or `update` action on submit.

`POST`
* This is the response from a form and should add a record to the database. It should come from a view created by the `new` action.
* Notice that no `POST` routes have an `/:id` in the URI. This is because you should be making a new record and don't have an ID to reference at this time.

`PATCH`
* This is a response from a form and should edit a record in the database.
* All routes that all `PATCH` actions have an `/:id` as part of their URI Pattern. This is to tell your controller which record you are editing.

`PUT`
* I'm a little shaky on this one, but I think it's the same as `PATCH` but sort of reserved for when you are overwriting a record? For now I think we're sticking with `PATCH` only.

`DELETE`
* This route will likely be accessed from a button press, which is technically a form.
* `DELETE` routes will include an `/:id` indicating which record will get deleted. Destroyed. Whatever.
