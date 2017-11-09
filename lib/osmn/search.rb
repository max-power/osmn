module OSMN
  class Search
    attr_accessor :params

    def initialize(**params)
      @params = default_params.merge(params)
    end
    
    def call
      parse request('/search') # if params[:q]
    end

    private
    
    def default_params
      { format: :json }
    end
    
    def request(action)
      Request.new(action, params).fetch
    end

    def parse(response)
      JSON.parse(response, object_class: OpenStruct)
    end
  end
end