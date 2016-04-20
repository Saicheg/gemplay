module Rubygems
  class Gem
    include HTTParty
    base_uri 'https://rubygems.org/api/v1'

    def self.exists?(gem_name)
      encoded_name = URI.encode(gem_name)
      response = self.get("/gems/#{encoded_name}.json")
      response.code == 404 ? false : true
    end
  end
end
