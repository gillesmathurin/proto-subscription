require 'spec_helper'

describe "/plans/show" do
  before(:each) do
    render 'plans/show'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/plans/show])
  end
end
