module OSMN
  class Search
    attr_accessor :params

    def initialize(**params)
      @params = default_params.merge(params)
    end
    
    def call
      parse request
    end

    private
    
    def default_params
      { format: :json }
    end
    
    def path
      "/search"
    end
    
    def request
      Request.new(path, params).fetch
    end

    def parse(response)
      JSON.parse response, object_class: OpenStruct
    end
  end
end