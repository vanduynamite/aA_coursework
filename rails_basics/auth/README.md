# Auth

## Use in Controllers

This is really the culmination of auth, so it's up here at the top. Once you have the `User` working with passwords and session tokens, and an overarching `ApplicationController` switching logged in status, you can start using `before_action :ensure_logged_in, only: %i(approve deny)` at the top of controller files. This will ensure that a user is indeed logged in before letting you access that route.

You can also write specific `require_if_condition!` methods that will redirect a user unless they are the **correct** user for a certain situation.

## User Model

### FRIPE

* `find_by_credentials(username, password)`
  * Find a user with that username, return `nil` if no user found
  * Check if the password is correct, return nil or user
* `reset_session_token!`
  * `self.session_token = generate_session_token`
  * `self.save!`
  * `self.session_token`
* `is_password?(password)`
  * `BCrypt::Password.new(self.password_digest).is_password?(password)`
* `password=(password)`
  * `@password = password`
  * `self.password_digest = BCrypt::Password.create(password)`
* `ensure_session_token`
  * This is to ensure a new user that is saved before logging in will have a `session_token`, which is `null: false`
  * `self.session_token ||= generate_session_token`
* `generate_session_token`
  * `SecureRandom::urlsafe_base64`

## Application Controller

### CELLL

* `current_user`
  * `return nil unless session[:session_token]` => maybe this line isn't necessary?
  * `@current_user ||= User.find_by(session_token: session[:session_token])`
* `ensure_logged_in`
  * Redirect if not logged in
* `logged_in?`
  * bang bang `current_user`
* `log_in!(user)`
  * Make the user get a new session token, then store that in cookies
* `log_out!`
  * Reset the user's session token
  * Then set `session[:session_token] = nil`

## Sessions Controller

* `new`
  * `render :index`
* `create`
  * Get input from a form, validate the user using `find_by_credentials`
  * Calls log_in! if valid, errors if not
* `destroy`
  * Calls log_out!

## Users Controller

* `new`
  * `render :index`
* `create`
  * Get input from a form, save the user
  * Calls `log_in!` if valid, errors if not
