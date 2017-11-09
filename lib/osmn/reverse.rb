module OSMN
  class Reverse < Search
    def call
      parse request('/reverse') #if params[:lat] && params[:lon]
    end
  end
end