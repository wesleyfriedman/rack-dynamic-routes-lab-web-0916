require 'pry'
class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = @@items.find {|item| req.path.include?(item.name)}
      resp.write item ? item.price : "Item not found"
      resp.status = 400 unless item
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end