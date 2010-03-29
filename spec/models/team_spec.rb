require 'spec_helper'

describe Team do
  before(:each) do
    @valid_attributes = {
      :nom => "value for nom",
      :adresse => "value for adresse",
      :zip => "value for zip",
      :ville => "value for ville",
      :country => "value for country",
      :adminname => "value for adminname",
      :adminpassword => "value for adminpassword"
    }
  end

  it "should create a new instance given valid attributes" do
    Team.create!(@valid_attributes)
  end
end
