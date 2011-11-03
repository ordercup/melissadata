require 'rubygems'
require 'typhoeus'
require 'builder'
require 'crack'
require 'lib/railsify'
require 'lib/melissa_data'
require 'lib/address'

address = MelissaData::Address.new(
  :address => '1 Infinite Loop', 
  :city => 'Cupertino', 
  :state => 'CA', 
  :zipcode => '',
  :country => 'United States'
)

puts address.valid?