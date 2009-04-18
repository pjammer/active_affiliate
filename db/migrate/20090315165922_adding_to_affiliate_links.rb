class AddingToAffiliateLinks < ActiveRecord::Migration
  def self.up
    add_column :affiliate_links, :account_id, :integer
  end

  def self.down
    remove_column :affiliate_links, :account_id
  end
end