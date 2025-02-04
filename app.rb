require "sinatra"
require "sinatra/reloader"

get("/") do

  @from_currency =

erb(:homepage)
end

get("/:currency_from") do

  @from_currency =
  @to_currency =

  erb(currency_exchange_start)
end

get("/:currency_from/:currency_to") do

  @from_currency =
  @to_currency =
  
  erb(currency_exchange_result)
end
