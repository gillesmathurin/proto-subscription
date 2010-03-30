class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  
  def create
    notify = Paypal::Notification.new(request.raw_post)
    if notify.acknowledge
      PaymentNotification.create!(:params => params, :subscription_id => params[:invoice],
       :status => params[:payer_status], :transaction_id => params[:txn_id])      
    end
    render :nothing => true
  end
    
end
