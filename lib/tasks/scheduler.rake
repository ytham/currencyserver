desc "This task is called by the Heroku scheduler add-on"

task :update_currencies => :environment do
  puts "Updating currency data"
  CurrenciesController.get_currencies
end
