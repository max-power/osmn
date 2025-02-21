module OSMN
  class Request
    def initialize(host, path, **params)
      @host   = host
      @path   = path
      @params = params
    end

    def fetch
      Net::HTTP.get uri
    end

    private

    def uri
      URI::HTTPS.build host: @host, path: @path, query: query
    end

    def query
      URI.encode_www_form @params
    end
  end
end
