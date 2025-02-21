module OSMN
  class Search
    attr_accessor :params

    def initialize(path='/search', **params)
      @path   = path
      @params = default_params.merge(params)
    end

    def call
      parse response
    end

    private

    def default_params
      { format: :json }
    end

    def response
      Request.new(HOST, @path, **params).fetch
    end

    def parse(response)
      JSON.parse response, object_class: OpenStruct
    end
  end
end