require 'json'
require 'net/http'
require 'ostruct'
require 'osmn/request'
require 'osmn/search'
require 'osmn/version'

module OSMN
  HOST = 'nominatim.openstreetmap.org'.freeze
  
  module_function

  def search(query = nil, **params)
    params.merge!(q: query) if query && !query.empty?
    Search.new(**params).call
  end

  def reverse_geocode(lat, lon, **params)
    Search.new('/reverse', **params.merge(lat: lat, lon: lon)).call
  end
  
  def lookup(*osm_ids, **params)
    Search.new('/lookup', **params.merge(osm_ids: osm_ids.join(','))).call
  end
  
  def status
    Search.new('/status').call
  end
end
