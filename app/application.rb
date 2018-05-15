class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
    #if req.path=="/items"
      item_name = req.path.split("/items/").last
      object = @@items.find {|x| x[:name] == item_name}
      price = object[:price]
      
      if @@items.include?(item_name)
        resp.write "#{price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
