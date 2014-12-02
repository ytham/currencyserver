class CurrenciesController < ApplicationController

  def index
    @currencies = Currency.all

    respond_to do |format|
      format.html 
      format.json { render json: @currencies }
    end
  end

  def get_currencies
    http request: "http://openexchangerates.org/api/latest.json?app_id=" + secret.api_key
end