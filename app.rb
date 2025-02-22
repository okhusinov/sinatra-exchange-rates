require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require "dotenv/load"

get("/") do

  exchange_rates_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"
  @raw_response = HTTP.get(exchange_rates_url)
  @raw_string = @raw_response.to_s
  @parsed_data = JSON.parse(@raw_string)
  @currencies = @parsed_data.fetch("currencies")

  erb(:homepage)

end

puts @parsed_data
