module OSMN
  class Request
    Host = 'nominatim.openstreetmap.org'.freeze

    def initialize(path, **params)
      @path   = path
      @params = params
    end

    def fetch
      Net::HTTP.get uri
    end

    private

    def uri
      URI::HTTP.build host: Host, path: @path, query: query
    end

    def query
      URI.encode_www_form @params
    end
  end
end
