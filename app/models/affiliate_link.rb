class AffiliateLink < ActiveRecord::Base
  belongs_to :account
  belongs_to :affiliate
  LINK_TYPES = ["Text", "Banner", "Half Banner"]
end
