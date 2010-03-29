class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :nom
      t.string :adresse
      t.string :zip
      t.string :ville
      t.string :country
      t.string :adminname
      t.string :adminpassword

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
