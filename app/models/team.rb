class Team < ActiveRecord::Base
  has_one :subscription, :dependent => :destroy
  validates_confirmation_of :adminpassword, :on => :create, :message => "should match confirmation"
end
