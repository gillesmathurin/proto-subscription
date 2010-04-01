class PaymentNotification < ActiveRecord::Base
  belongs_to :subscription
  serialize :params
  after_create :mark_subscription_as_verified
  
  private
  
  def mark_subscription_as_verified
    subscriber_id = params[:subscr_id]
    if status == "verified" && params[:txn_type] == "subscr_signup" && params[:receiver_email] == APP_CONFIG[:paypal_email] && params[:mc_amount3] == "39.90" && params[:currency_code] == "EUR"
      subscription.update_attributes(:start_date => Time.now, :trial_expiration_date => Time.now + 1.month, :status => "verified", :subscriber_id => subscriber_id)
    elsif status == "verified" && params[:txn_type] == "subscr_cancel"
      subscription.update_attribute(:status => "cancel")
    end
  end
end
