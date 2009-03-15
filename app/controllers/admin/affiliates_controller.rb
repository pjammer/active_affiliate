class Admin::AffiliatesController < ApplicationController
  before_filter :login_required
  before_filter :admin?
  layout "admin"
  #Show all users who are affiliates. 
  #TODO: Add a quick look table of what you owe to who. integrate into paypal somehow for them to send the money.
  def index
    @affiliates = @account.affiliates.paginate(:page => params[:page], :order => "id desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end
#Used to show the affiliates information like paypal addy and affiliate_code
  def show
    @affiliate = @account.affiliates.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end
  #only admin can delete affiliates.  Right now is the easiest way to ensure someone doesn't accidently delete their affiliate account, losing all data.
  def destroy
    @affiliate = @account.affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to(admin_affiliates_url) }
      format.xml  { head :ok }
    end
  end
end