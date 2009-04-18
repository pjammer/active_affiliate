module Admin::AffiliateLinksHelper
  #Link used to show the relevant code for the affiliate.
  def display_link(text, affiliate_link_id, code)
    link_to text, affiliate_link_url("#{affiliate_link_id}")+"?#{code}"
  end
end