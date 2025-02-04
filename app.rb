require "sinatra"
require "sinatra/reloader"

get("/") do
erb(:flexible)
end

get("/:currency_from") do
  erb(currency_exchange_start)
end

get("/:currency_from/:currency_to") do
  erb(currency_exchange_result)
end
