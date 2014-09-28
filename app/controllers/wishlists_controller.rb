class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.all
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    wishlist = Wishlist.where(tour_id: params[:tour_id], user_id: current_user.id)
    if wishlist.empty?
      @wishlist = Wishlist.new(tour_id: params[:tour_id], user_id: current_user.id)
      respond_to do |format|
      if @wishlist.save
        format.html { redirect_to :back, notice: 'Wishlist was successfully add.' }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
    else
       redirect_to :back, :notice => 'Wishlist has been added'
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    #tour = Tour.find_by(slug: params[:id])
    #@wishlist = Wishlist.find_by(tour_id: tour.id)
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Wishlist was successfully delete.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.permit(:tour_id, :user_id)
    end
end
