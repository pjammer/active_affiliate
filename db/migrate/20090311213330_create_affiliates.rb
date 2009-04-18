class CreateAffiliates < ActiveRecord::Migration
  def self.up
    create_table :affiliates do |t|
      t.integer :user_id
      t.string :paypal_email
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliates
  end
end
