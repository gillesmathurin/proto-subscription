class CreatePaymentNotifications < ActiveRecord::Migration
  def self.up
    create_table :payment_notifications do |t|
      t.string :params
      t.integer :subscription_id
      t.string :status
      t.integer :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_notifications
  end
end
