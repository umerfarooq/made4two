class GalleryToursController < ApplicationController
  before_action :set_gallery_tour, only: [:show, :edit, :update, :destroy]

  # GET /gallery_tours
  # GET /gallery_tours.json
  def index
    @gallery_tours = GalleryTour.all
  end

  # GET /gallery_tours/1
  # GET /gallery_tours/1.json
  def show
  end

  # GET /gallery_tours/new
  def new
    @gallery_tour = GalleryTour.new
  end

  # GET /gallery_tours/1/edit
  def edit
  end

  # POST /gallery_tours
  # POST /gallery_tours.json
  def create
    @gallery_tour = GalleryTour.new(gallery_tour_params)

    respond_to do |format|
      if @gallery_tour.save
        format.html { redirect_to @gallery_tour}
        format.json { render :show, status: :created, location: @gallery_tour }
      else
        format.html { render :new }
        format.json { render json: @gallery_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallery_tours/1
  # PATCH/PUT /gallery_tours/1.json
  def update
    respond_to do |format|
      if @gallery_tour.update(gallery_tour_params)
        format.html { redirect_to @gallery_tour}
        format.json { render :show, status: :ok, location: @gallery_tour }
      else
        format.html { render :edit }
        format.json { render json: @gallery_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_tours/1
  # DELETE /gallery_tours/1.json
  def destroy
    @gallery_tour.destroy
    respond_to do |format|
      format.html { redirect_to gallery_tours_url, notice: 'Gallery tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_tour
      @gallery_tour = GalleryTour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_tour_params
      params.require(:gallery_tour).permit(:title, :image, :content, :status, :tour_id)
    end
end
