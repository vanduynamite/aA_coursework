require 'rack'
require 'byebug'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.status = '200'
  res.write("Hello World!")
  debugger
  res.write(req.path)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
