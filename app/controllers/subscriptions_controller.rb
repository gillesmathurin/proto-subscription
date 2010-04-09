class SubscriptionsController < ApplicationController
  def new
    @team = Team.new
    if params[:plan_id]
      @subscription = @team.build_subscription(:plan_id => params[:plan_id])
    else  
      @subscription = @team.build_subscription()
    end
  end
  
  def edit
    @team = Team.find(params[:id])
    @subscription = @team.subscription
  end
  
  def trial
    @team = Team.new
    @subscription = @team.build_subscription()
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
  
  def create
    @team = Team.new(params[:team])
    @subscription = @team.build_subscription(params[:subscription])
    @team.save
    redirect_to verify_subscription_path(@team.subscription)
  end
  
  def create_trial
    @team = Team.new(params[:team])
    @subscription = @team.build_subscription(:status => "trial", :start_date => Time.now, :trial_expiration_date => Time.now + 3.minutes)
    @team.save
    redirect_to team_home_welcome_path(@team.id)
  end
  
  def verify
    @subscription = Subscription.find(params[:id])
    @team = @subcription.team
  end
end
