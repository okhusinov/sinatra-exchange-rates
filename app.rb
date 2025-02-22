require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "dotenv/load"

exchange_rates_api_key = ENV.fetch("EXCHANGE_RATES_KEY")
exchange_rates_url = "https://api.exchangerate.host/list?access_key=#{exchange_rates_api_key}"
raw_exchange_rates_response = HTTP.get(exchange_rates_url)
parsed_exchange_rates_response = JSON.parse(raw_exchange_rates_response)


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
