require 'json'
require 'byebug'

class Session
  attr_reader :session_cookie_value
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    # req.cookies # => this is a hash of JSON objects (which are basically hashes)
    if req.cookies['_rails_lite_app']
      @session_cookie_value = JSON.parse(req.cookies['_rails_lite_app'])
    else
      @session_cookie_value = {}
    end
  end

  def [](key)
    session_cookie_value[key]
  end

  def []=(key, val)
    session_cookie_value[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', {path: '/', value: session_cookie_value.to_json})
  end
end
