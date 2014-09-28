class GetInTouchesController < ApplicationController
  before_action :set_get_in_touch, only: [:show, :edit, :update, :destroy]

  # GET /get_in_touches
  # GET /get_in_touches.json
  def index
    @get_in_touches = GetInTouch.all
  end

  # GET /get_in_touches/1
  # GET /get_in_touches/1.json
  def show
  end

  # GET /get_in_touches/new
  def new
    @get_in_touch = GetInTouch.new
  end

  # GET /get_in_touches/1/edit
  def edit
  end

  # POST /get_in_touches
  # POST /get_in_touches.json
  def create
    @get_in_touch = GetInTouch.new(get_in_touch_params)

    respond_to do |format|
      if @get_in_touch.save
        format.html { redirect_to @back, notice: 'Successfully send.' }
        format.js
        format.json { render :show, status: :created, location: @get_in_touch }
      else
        format.html { render :new }
        format.js
        format.json { render json: @get_in_touch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /get_in_touches/1
  # PATCH/PUT /get_in_touches/1.json
  def update
    respond_to do |format|
      if @get_in_touch.update(get_in_touch_params)
        format.html { redirect_to @get_in_touch, notice: 'Get in touch was successfully updated.' }
        format.json { render :show, status: :ok, location: @get_in_touch }
      else
        format.html { render :edit }
        format.json { render json: @get_in_touch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /get_in_touches/1
  # DELETE /get_in_touches/1.json
  def destroy
    @get_in_touch.destroy
    respond_to do |format|
      format.html { redirect_to get_in_touches_url, notice: 'Get in touch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_get_in_touch
      @get_in_touch = GetInTouch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def get_in_touch_params
      params.require(:get_in_touch).permit(:name, :email, :subject, :message)
    end
end
