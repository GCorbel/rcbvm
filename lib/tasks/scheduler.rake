require 'net/http'
desc "This task is called by the Heroku cron add-on"
task :call_page => :environment do
  uri = URI.parse('http://www.base-de-moisie.ca/')
  Net::HTTP.get(uri)
end
