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
    params.merge!(q: query) unless query.to_s.empty?
    request '/search', **params
  end

  def reverse_geocode(lat, lon, **params)
    request '/reverse', **params.merge(lat: lat, lon: lon)
  end
  
  def lookup(*osm_ids, **params)
    request '/lookup', **params.merge(osm_ids: osm_ids.join(','))
  end
  
  def status
    request '/status'
  end
  
  def request(path, **params)
    Search.new(path, **params).call
  end
end
