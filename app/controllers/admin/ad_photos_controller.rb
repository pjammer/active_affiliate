class Admin::AdPhotosController < ApplicationController
  before_filter :login_required
  # before_filter :has_role_admin
  # layout "admin"
  # GET /ad_photos
  # GET /ad_photos.xml
  def index
    @ad_photos = AdPhoto.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ad_photos }
    end
  end

  # GET /ad_photos/1
  # GET /ad_photos/1.xml
  def show
    @ad_photo = AdPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad_photo }
    end
  end

  # GET /ad_photos/new
  # GET /ad_photos/new.xml
  def new
    @ad_photo = AdPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad_photo }
    end
  end

  # GET /ad_photos/1/edit
  def edit
    @ad_photo = AdPhoto.find(params[:id])
  end

  # POST /ad_photos
  # POST /ad_photos.xml
  def create
    @ad_photo = AdPhoto.new(params[:ad_photo])

    respond_to do |format|
      if @ad_photo.save
        flash[:notice] = 'AdPhoto was successfully created.'
        format.html { redirect_to([:admin, @ad_photo]) }
        format.xml  { render :xml => @ad_photo, :status => :created, :location => @ad_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ad_photos/1
  # PUT /ad_photos/1.xml
  def update
    @ad_photo = AdPhoto.find(params[:id])

    respond_to do |format|
      if @ad_photo.update_attributes(params[:ad_photo])
        flash[:notice] = 'AdPhoto was successfully updated.'
        format.html { redirect_to([:admin, @ad_photo]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_photos/1
  # DELETE /ad_photos/1.xml
  def destroy
    @ad_photo = AdPhoto.find(params[:id])
    @ad_photo.destroy

    respond_to do |format|
      format.html { redirect_to(admin_ad_photos_url) }
      format.xml  { head :ok }
    end
  end
  
  #taken from http://garbageburrito.com/blog/entry/135/javascript-image-cropping-with-jscropperui-and-rails
  def crop_and_close
    @setting = AdPhoto.find(params[:id])  #how they got their image
    if params[:x1]
      img = Magick::Image::read(@setting.full_filename).first
      img.crop!(::Magick::CenterGravity, params[:x1].to_i, params[:y1].to_i,
         params[:width].to_i, params[:height].to_i, true)
      img.write @setting.full_filename
    end
    respond_to do |format|
      format.html { redirect_to(admin_ad_photos_url) }
      format.xml  { head :ok }
    end
  end
  
end
