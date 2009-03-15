class AffiliatesController < ApplicationController
  
 
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @affiliates }
    end
  end

  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end

  def new
    @affiliate = Affiliate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @affiliate }
    end
  end

  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  def create
    @affiliate = Affiliate.new(params[:affiliate])
    @affiliate.user_id = current_user.id
    @affiliate.account_id = current_account.id
    @affiliate.affiliate_unique_code
    respond_to do |format|
      if @affiliate.save

        flash[:notice] = 'Affiliate was successfully created.'
        format.html { redirect_to(@affiliate) }
        format.xml  { render :xml => @affiliate, :status => :created, :location => @affiliate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        flash[:notice] = 'Affiliate was successfully updated.'
        format.html { redirect_to(@affiliate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @affiliate.errors, :status => :unprocessable_entity }
      end
    end
  end

end
