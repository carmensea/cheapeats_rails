class RestsController < ApplicationController
  def index
    yelp = YelpAdapter.new
    @rests = yelp.custom_search(params)
  end

  def create
  end

  def show

  end
end
