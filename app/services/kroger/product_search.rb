module Kroger

  class ProductSearch
    def self.call(*args, &block)
      new(*args, &block).execute
    end

    def initialize(search)
      @search = search
    end

    def execute
      response = RestClient.get("https://api.kroger.com/v1/products?filter.term=#{@search}&filter.limit=5&filter.locationId=01400376",
                                accept: "application/json",
                                authorization: "Bearer #{Kroger::Authentication.call}")
      return JSON.parse(response)
    end
  end
end
