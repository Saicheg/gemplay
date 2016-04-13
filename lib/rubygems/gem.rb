module Rubygems
  class Gem
    include HTTParty
    base_uri 'https://rubygems.org/api/v1'

    def self.exists?(gem_name)
      response = self.get("/gems/#{gem_name}.json")
      response.code == 404 ? false : true
    end
  end
end
