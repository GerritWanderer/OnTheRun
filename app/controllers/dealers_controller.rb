# frozen_string_literal: true

class DealersController < ApplicationController
  def index
    # use a scope to only return dealers with lat and long
    @props = { dealers: Dealer.all.limit(1) }
  end
end
