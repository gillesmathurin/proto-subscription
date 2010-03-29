class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
  end

end
