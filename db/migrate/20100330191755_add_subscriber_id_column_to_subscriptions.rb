class AddSubscriberIdColumnToSubscriptions < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :subscriber_id, :string
  end

  def self.down
    remove_column :subscriptions, :subscriber_id
  end
end
