class Admin::AffiliatesController < ApplicationController
  before_filter :login_required
  #before_filter :has_role_admin
  layout "affiliate_admin"
  #Show all users who are affiliates. 
  #TODO: Add a quick look table of what you owe to who. integrate into paypal somehow for them to send the money.
  def index
    @affiliates = Affiliate.paginate(:page => params[:page], :order => "id desc")
    @affiliate = Affiliate.find_by_user_id(current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end
#Used to show the affiliates information like paypal addy and affiliate_code
  def show
    @affiliate = Affiliates.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end
  #only admin can delete affiliates.  Right now is the easiest way to ensure someone doesn't accidently delete their affiliate account, losing all data.
  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to(admin_affiliates_url) }
      format.xml  { head :ok }
    end
  end
end