require 'json'
require 'net/http'
require 'ostruct'
require 'osmn/request'
require 'osmn/search'
require 'osmn/reverse'
require 'osmn/version'

module OSMN
  module_function

  def search(q, details = 0)
    Search.new(q: q, addressdetails: details).call
  end

  def reverse_geocode(lat, lon, details = 0)
    Reverse.new(lat: lat, lon: lon, addressdetails: details).call
  end
end
