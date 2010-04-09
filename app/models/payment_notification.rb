class PaymentNotification < ActiveRecord::Base
  belongs_to :subscription
  serialize :params
  after_create :mark_subscription_as_verified
  
  private
  
  def mark_subscription_as_verified
    subscriber_id = params[:subscr_id]
    if (status == "verified" || status == "paid")
      subscription.update_attributes(:start_date => Time.now, :trial_expiration_date => Time.now + 1.month, :status => "verified", :subscriber_id => subscriber_id)
    elsif status == "cancel"
      subscription.update_attribute(:status => "cancel")
    end
  end
end
