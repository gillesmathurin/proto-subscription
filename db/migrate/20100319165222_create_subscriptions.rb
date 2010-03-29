class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :team_id
      t.integer :plan_id
      t.string :status
      t.datetime :start_date
      t.datetime :expiration_date
      t.datetime :trial_expiration_date

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
