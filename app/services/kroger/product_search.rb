module Kroger

  class ProductSearch
    def self.call(*args, &block)
      new(*args, &block).execute
    end

    def initialize

    end

    def execute

    end
  end
end


https://api.kroger.com/v1/products?filter.term='cheese'
