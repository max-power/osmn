require 'json'
require 'net/http'
require 'ostruct'
require 'osmn/request'
require 'osmn/search'
require 'osmn/reverse'
require 'osmn/lookup'
require 'osmn/version'

module OSMN
  module_function

  def search(query, **params)
    Search.new(params.merge(q: query)).call
  end

  def reverse_geocode(lat, lon, **params)
    Reverse.new(params.merge(lat: lat, lon: lon)).call
  end
  
  def lookup(*osm_ids, **params)
    Lookup.new(params.merge(osm_ids: osm_ids.join(','))).call
  end
end
