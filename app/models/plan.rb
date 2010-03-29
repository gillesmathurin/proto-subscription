class Plan < ActiveRecord::Base
  has_many :subscriptions
  
  def price_with_decimal
    price_in_cent.to_f / 100
  end
end
