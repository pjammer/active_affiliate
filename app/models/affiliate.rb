require 'digest/sha1'
class Affiliate < ActiveRecord::Base
#TODO: remove these filters, add a lib/before_filters.rb file or comment out but include what SHOULD go there.
  belongs_to :account
  belongs_to :user
  validates_presence_of :paypal_email
  validates_format_of :paypal_email, :with => Authentication.email_regex, :message => Authentication.bad_email_message
  #ToDo: add valadation that checks for user_id and account_id only one user and account_id combo allowed per account.
  
  #make a unique code
  def affiliate_unique_code
    self.make_affiliate_code
  end
  protected
  def make_affiliate_code
    self.affiliate_code = self.make_token
  end
    def secure_digest(*args)
      Digest::SHA1.hexdigest(args.flatten.join('--'))
    end

    def make_token
      secure_digest(Time.now, (1..10).map{ rand.to_s })
    end
end
