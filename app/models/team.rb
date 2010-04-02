class Team < ActiveRecord::Base
  has_one :subscription, :dependent => :destroy
  validates_confirmation_of :adminpassword, :on => :create, :message => "should match confirmation"
  
  def trial_account_valid?
    expiration_date = self.subscription.trial_expiration_date
    expiration_date > Time.now
  end
end
