require 'spec_helper'

describe Subscription do
  before(:each) do
    @valid_attributes = {
      :team_id => 1,
      :plan_id => 1,
      :status => "value for status",
      :start_date => Time.now,
      :expiration_date => Time.now,
      :trial_expiration_date => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Subscription.create!(@valid_attributes)
  end
end
