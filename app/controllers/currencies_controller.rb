class CurrenciesController < ApplicationController
  respond_to :json
  require 'net/http'

  def index
    #get_currencies
    respond_with Currency.all
  end


  def self.get_currencies
    puts "Running self.get_currencies"
    url = URI.parse("http://openexchangerates.org/api/latest.json?app_id=" + ENV["CURRENCY_API_KEY"])
    http = Net::HTTP.new(url.host, url.port)
    req = Net::HTTP::Get.new(url.request_uri)
    res = http.request(req)

    data = JSON.parse(res.body)
    rates = data["rates"]
    rates.each do |code, value|
      currency = Currency.find_by code: code
      if currency != nil
        # puts "Found currency!!"
        # puts currency["country"]
        currency.update_attributes(value: value)
      end
    end
    #return data["rates"]
  end

  def self.get_last_refresh
    Currency.each do |c|
      puts c["updated_at"]
    end
  end

end