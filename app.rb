require "sinatra"
require "sinatra/reloader"
require "dotenv"
Dotenv.load

require "http"

require "json"

get("/") do

# Assemble the API url, including the API key in the query string
  api_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}"

  # Use HTTP.get to retrieve the API data
  @raw_response = HTTP.get(api_url)

  # Get the body of the response as a string
  @raw_string = @raw_response.to_s

  # Convert the string to JSON
  @parsed_data = JSON.parse(@raw_string)

# Render a view template
erb(:homepage)
end

get("/:from_currency") do

  @original_currency = params.fetch("from_currency")

  api_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}"
  
  # Some more code to parse the URL and render a view template.
  # (HINT: this code is identical to the first route, you just
  # render a different view template at the end.)

    # Use HTTP.get to retrieve the API data
    @raw_response = HTTP.get(api_url)

    # Get the body of the response as a string
    @raw_string = @raw_response.to_s
  
    # Convert the string to JSON
    @parsed_data = JSON.parse(@raw_string)

  erb(:currency_exchange_start)
end

get("/:from_currency/:to_currency") do

  @original_currency = params.fetch("from_currency")
  @destination_currency = params.fetch("to_currency")

    api_url = "https://api.exchangerate.host/convert?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}&from=#{@original_currency}&to=#{@destination_currency}&amount=1"

        # Use HTTP.get to retrieve the API data
        @raw_response = HTTP.get(api_url)

        # Get the body of the response as a string
        @raw_string = @raw_response.to_s
      
        # Convert the string to JSON
        @exchange_rate = JSON.parse(@raw_string)
  
  erb(:currency_exchange_result)
end
