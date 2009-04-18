class Admin::AffiliateLinksController < ApplicationController
  before_filter :login_required
  before_filter :has_role_admin
  layout "admin"
  # GET /affiliate_settings  # GET /affiliate_links
  # GET /affiliate_links.xml
  def index
    @affiliate_links = AffiliateLink.find(:all)
    @affiliate_setting = AffiliateSetting.find_by_account_id(current_account)
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

  # GET /affiliate_links/new
  # GET /affiliate_links/new.xml
  def new
    @affiliate_link = AffiliateLink.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate_link }
    end
  end

  # GET /affiliate_links/1/edit
  def edit
    @affiliate_link = AffiliateLink.find(params[:id])
  end

  # POST /affiliate_links
  # POST /affiliate_links.xml
  def create
    @affiliate_link = AffiliateLink.new(params[:affiliate_link])
    @affiliate_link.affiliate_id = current_account.id
    respond_to do |format|
      if @affiliate_link.save
        flash[:notice] = 'AffiliateLink was successfully created.'
        format.html { redirect_to(@affiliate_link) }
        format.xml  { render :xml => @affiliate_link, :status => :created, :location => @affiliate_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /affiliate_links/1
  # PUT /affiliate_links/1.xml
  def update
    @affiliate_link = AffiliateLink.find(params[:id])

    respond_to do |format|
      if @affiliate_link.update_attributes(params[:affiliate_link])
        flash[:notice] = 'AffiliateLink was successfully updated.'
        format.html { redirect_to(@affiliate_link) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate_links/1
  # DELETE /affiliate_links/1.xml
  def destroy
    @affiliate_link = AffiliateLink.find(params[:id])
    @affiliate_link.destroy

    respond_to do |format|
      format.html { redirect_to(affiliate_links_url) }
      format.xml  { head :ok }
    end
  end
end
