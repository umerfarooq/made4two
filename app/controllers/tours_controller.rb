class ToursController < ApplicationController
  before_action :set_tour, only: [:edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.search(params[:search]).page(params[:page]).per(10)
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    @tour = Tour.friendly.find(params[:id])
    @gallery_tours = GalleryTour.where(status: true, tour_id: @tour.id.to_s)
    @line_items = LineItem.where(cart_id: session[:cart_id])
    @we_loves = WeLove.where(tour_id: set_tour)
    @includes = Include.where(tour_id: set_tour)
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour}
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to admin_tours_url}
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:title, :location, :price, :image)
    end
end
