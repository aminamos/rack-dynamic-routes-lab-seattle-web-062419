require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_requested = req.path.split("/items/").last
      item = @@items.find{ |i| i.name == item_requested}
      
      if item == nil
        resp.write "Item not found"
        resp.status = 400
      else
        
        resp.write "Price of the item is: #{item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end



