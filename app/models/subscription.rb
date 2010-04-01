class Subscription < ActiveRecord::Base
  belongs_to :team
  belongs_to :plan
  has_one :payment_notification
  

end
