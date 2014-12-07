desc "This task is called by the Heroku scheduler add-on"

task :update_currencies => :environment do
  puts "Updating currency data"
  CurrenciesController.get_currencies
end

desc "Pings PING_URL to keep a dyno alive"
task :dyno_ping do
  require "net/http"

  if ENV['PING_URL']
    uri = URI(ENV['PING_URL'])
    Net::HTTP.get_response(uri)
  end
end