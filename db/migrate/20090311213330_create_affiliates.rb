class CreateAffiliates < ActiveRecord::Migration
  def self.up
    create_table :affiliates do |t|
      t.integer :user_id, :account_id
      t.string :paypal_email, :affiliate_code

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliates
  end
end
