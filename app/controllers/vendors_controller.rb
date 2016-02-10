class VendorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_vendor, only: [:show, :edit, :update, :destroy, :admin_idex]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def validate_vendor
    @vendor.approved = true
    @vendor.save
  end

  def admin_index
    @vendors = Vendor.where(:approved => false)
    @admin = true
    render 'index'
  end
  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.where(:approved => true)
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    #@marker = "[{\"lat\":#{@vendor.latitude},\"lng\":#{@vendor.latitude}}]"
    @hash = Gmaps4rails.build_markers(@vendor) do |vendor, marker|
      marker.lat vendor.latitude
      marker.lng vendor.longitude
    end
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    #logger.info params[:vendor]
    @vendor = Vendor.new(vendor_params)
    @vendor.approved = false

    respond_to do |format|
      if @vendor.save
        current_user.vendor_id = @vendor.id
        current_user.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:name, :description, :address, :longitude, :latitude)
    end
end
