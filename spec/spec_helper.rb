require 'rubygems'
require 'trakt'
require 'vcr'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
  # config.include InvoiceMacros
  
  

  
  config.before(:each) do
    @client = Trakt.new("33421080278fd8af6fcfe96552805a66", "TheMaster", "supermand")
  end
end