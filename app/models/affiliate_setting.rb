class AffiliateSetting < ActiveRecord::Base
  belongs_to :account
  PERCENTAGES = (5..70).step(5)
end
