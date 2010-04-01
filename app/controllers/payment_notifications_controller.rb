class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  
  def create
    notify = Paypal::Notification.new(request.raw_post)
    if notify.acknowledge && notify.mc_amount3 == plan_price(params[:invoice]) 
      PaymentNotification.create!(:params => params, :subscription_id => params[:invoice],
       :status => "verified")      
    end
    render :nothing => true
  end
  
  private
  
  def plan_price(invoice)
    Subscription.find(invoice).plan.price_with_decimal.to_s
  end  
end
