class SubscriptionsController < ApplicationController
  def new
    @team = Team.new
    @subscription = @team.build_subscription(:plan_id => params[:plan_id])
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
  
  def verify
    @subscription = Subscription.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])
    @subscription = @team.build_subscription(params[:subscription])
    @team.save
    redirect_to verify_subscription_path(@team.subscription)
  end
  
  def checkout
    
  end
end
