class CreateAffiliateSettings < ActiveRecord::Migration
  def self.up
    create_table :affiliate_settings do |t|
      t.integer :user_id
      t.integer :affiliate_id
      t.integer :account_id
      t.integer :affiliate_percentage

      t.timestamps
    end
  end

  def self.down
    drop_table :affiliate_settings
  end
end
