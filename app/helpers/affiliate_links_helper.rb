module AffiliateLinksHelper
  #Link used to show the relevant code for the affiliate.
  def display_link(text, code, link_url=root_url)
    link_to text, link_url+"?#{code}"
  end
end
