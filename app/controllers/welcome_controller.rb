class WelcomeController < ApplicationController
  
  def index
  end
  
  def team_home
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team.trial_account_valid?
        format.html { }
      else
        format.html { redirect_to new_subscription_url(:id => @team.id) }
      end
    end
  end
  
end
