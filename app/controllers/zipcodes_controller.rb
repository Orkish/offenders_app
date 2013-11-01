class ZipcodesController < ApplicationController

  def index
    @zipcodes = Zipcode.all
  end

end
