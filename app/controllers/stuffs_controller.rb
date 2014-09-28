class StuffsController < ApplicationController
  before_action :set_stuff, only: [:edit, :update, :destroy]

  # GET /stuffs
  # GET /stuffs.json
  def index
    @high_price = Tour.where(:type => params[:type]).order(price: :desc).page(params[:page]).per(10)
    @lower_price = Tour.where(:type => params[:type]).order(price: :asc).page(params[:page]).per(10)
  end

  # GET /stuffs/1
  # GET /stuffs/1.json
  def show
    stuff = Stuff.friendly.find(params[:id])
    @stuff = Stuff.find(stuff.id)
    @high_price = Tour.where(stuff_id: stuff.id).order(price: :desc).page(params[:page]).per(10)
    @lower_price = Tour.where(stuff_id: stuff.id).order(price: :asc).page(params[:page]).per(10)
  end

  # GET /stuffs/new
  def new
    @stuff = Stuff.new
  end

  # GET /stuffs/1/edit
  def edit
  end

  # POST /stuffs
  # POST /stuffs.json
  def create
    @stuff = Stuff.new(stuff_params)

    respond_to do |format|
      if @stuff.save
        format.html { redirect_to @stuff, notice: 'Stuff was successfully created.' }
        format.json { render :show, status: :created, location: @stuff }
      else
        format.html { render :new }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuffs/1
  # PATCH/PUT /stuffs/1.json
  def update
    respond_to do |format|
      if @stuff.update(stuff_params)
        format.html { redirect_to @stuff, notice: 'Stuff was successfully updated.' }
        format.json { render :show, status: :ok, location: @stuff }
      else
        format.html { render :edit }
        format.json { render json: @stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuffs/1
  # DELETE /stuffs/1.json
  def destroy
    @stuff.destroy
    respond_to do |format|
      format.html { redirect_to stuffs_url, notice: 'Stuff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuff
      @stuff = Stuff.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stuff_params
      params.require(:stuff).permit(:name, :type, :status)
    end
end
