class Admin::AffiliateSettingsController < ApplicationController
  before_filter :login_required
  # before_filter :has_role_admin
  layout "affiliate_admin"
  # GET /affiliate_settings
  # GET /affiliate_settings.xml
  def index
    @affiliate_setting = AffiliateSetting.first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate_setting }
    end
  end

  # GET /affiliate_settings/1
  # GET /affiliate_settings/1.xml
  def show
    @affiliate_setting = AffiliateSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate_setting }
    end
  end

  # GET /affiliate_settings/new
  # GET /affiliate_settings/new.xml
  def new
    @affiliate_setting = AffiliateSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate_setting }
    end
  end

  # GET /affiliate_settings/1/edit
  def edit
    @affiliate_setting = AffiliateSetting.find(params[:id])
  end

  # POST /affiliate_settings
  # POST /affiliate_settings.xml
  def create
    @affiliate_setting = AffiliateSetting.new(params[:affiliate_setting])
    # @affiliate_setting.account_id = current_account.id #used if you have an account based app.
    @affiliate_setting.user_id = current_user.id
    respond_to do |format|
      if @affiliate_setting.save
        flash[:notice] = 'AffiliateSetting was successfully created.'
        format.html { redirect_to([:admin, @affiliate_setting]) }
        format.xml  { render :xml => @affiliate_setting, :status => :created, :location => @affiliate_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /affiliate_settings/1
  # PUT /affiliate_settings/1.xml
  def update
    @affiliate_setting = AffiliateSetting.find(params[:id])

    respond_to do |format|
      if @affiliate_setting.update_attributes(params[:affiliate_setting])
        flash[:notice] = 'AffiliateSetting was successfully updated.'
        format.html { redirect_to([:admin, @affiliate_setting]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate_settings/1
  # DELETE /affiliate_settings/1.xml
  def destroy
    @affiliate_setting = AffiliateSetting.find(params[:id])
    @affiliate_setting.destroy

    respond_to do |format|
      format.html { redirect_to(admin_affiliate_settings_url) }
      format.xml  { head :ok }
    end
  end
end
