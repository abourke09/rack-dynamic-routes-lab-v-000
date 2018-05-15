class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
    #if req.path=="/items"
      item_name = req.path.split("/items/").last
      price = @@items.find{|s| s.name == item_name}

      if @@items.include?(item_name)
        resp.write "#{price}"

      resp.write song.artist
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
