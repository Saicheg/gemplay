class RubygemsController < ApplicationController
  def index
    @rubygems = Rubygem.all
  end
end
