class Subscription < ActiveRecord::Base
  belongs_to :team
  belongs_to :plan
  has_one :payment_notification
  
  def paypal_url(return_url, notify_url)
    values = {
      :business => 'gilles_1269469014_biz@me.com', # Your PayPal ID or an email address associated with your PayPal account. Email addresses must be confirmed.
      :cmd => "_xclick-subscriptions",
      :lc => "FR",
      :item_name => 'Coachcamp Abonnement Standard', # Description of item being sold (maximum 127 characters)
      :a1 => 0, # Trial period 1 price. For a free trial period, specify 0.
      :p1 => 1, # Trial period 1 duration
      :t1 =>  'M', # Trial period unit, M for month
      :a3 => self.plan.price_with_decimal, # regular subscription price
      :p3 => 1, # Subscription duration
      :t3 => 'M',
      :src => 1,
      :invoice => id, # Passthrough variable you can use to identify your invoice number for this purchase
      :return => return_url, # return_url
      :notify_url => notify_url,
      :currency_code => 'EUR',
      :ipn_test => 1
    }
    "https://www.sandbox.paypal.com/cgi-bin/websrc?"+values.map {|k,v| "#{k}=#{v}"}.join("&")
  end
end
