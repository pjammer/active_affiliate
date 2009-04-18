class AffiliateLinksController < ApplicationController
  # GET /affiliate_links
  # GET /affiliate_links.xml
  def index
    @affiliate_links = AffiliateLink.paginate(:page => params[:page])
    @affiliate = Affiliate.find_by_user_id(current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliate_links }
    end
  end

  # GET /affiliate_links/1
  # GET /affiliate_links/1.xml
  def show
    @affiliate_link = AffiliateLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate_link }
    end
  end
end
