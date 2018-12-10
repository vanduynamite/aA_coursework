require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require "byebug"
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    unless already_built_response?
      @res.location = url
      @res.status = 302
      session.store_session(res)
      @already_built_response = true
    else
      raise "Can't double redirect"
    end
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    unless already_built_response?
      res['Content-Type'] = content_type
      res.write(content)
      session.store_session(res)
      @already_built_response = true
    else
      raise "Can't double render"
    end
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    # File.dirname("views/#{self.class.to_s.underscore}/#{template_name}.html.erb")
    file_path = File.join("views", self.class.to_s.underscore, "#{template_name}.html.erb")
    contents = File.read(file_path)

    template = ERB.new(contents)
    results = template.result(binding)

    render_content(results, "text/html")
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    name.send
    render(name) unless already_built_response
  end
end
