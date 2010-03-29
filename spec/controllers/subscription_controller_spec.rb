require 'spec_helper'

describe SubscriptionController do

  #Delete these examples and add some real ones
  it "should use SubscriptionController" do
    controller.should be_an_instance_of(SubscriptionController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
