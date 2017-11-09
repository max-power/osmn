require 'json'
require 'net/http'
require 'ostruct'
require 'osmn/request'
require 'osmn/search'
require 'osmn/reverse'
require 'osmn/version'

module OSMN
  module_function

  def search(query, **params)
    Search.new(params.merge(q: query)).call
  end

  def reverse_geocode(lat, lon, **params)
    Reverse.new(params.merge(lat: lat, lon: lon)).call
  end
end
