class AdvertisersController < ApplicationController
  def index
    @advertisers_list = AdvertisersList.new
  end
end
