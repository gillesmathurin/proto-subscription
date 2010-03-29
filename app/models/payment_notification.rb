class PaymentNotification < ActiveRecord::Base
  belongs_to :subscription
  serialize :params
  after_create :mark_subscription_as_completed
  
  private
  
  def mark_subscription_as_completed
    if status == "Completed"
      subscription.update_attributes(:start_date => Time.now, :trial_expiration_date => Time.now + 1.month, :status => "paid")
    end
  end
end
