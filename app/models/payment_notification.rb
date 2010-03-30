class PaymentNotification < ActiveRecord::Base
  belongs_to :subscription
  serialize :params
  after_create :mark_subscription_as_verified
  
  private
  
  def mark_subscription_as_verified
    if status == "verified"
      subscription.update_attributes(:start_date => Time.parse(self.params[:subscr_date]), :trial_expiration_date => Time.parse(self.params[:subscr_date] + 1.month, :status => "verified", :subscriber_id => self.params[:subscr_id])
    end
  end
end
