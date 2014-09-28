class WeLovesController < ApplicationController
  before_action :set_we_love, only: [:show, :edit, :update, :destroy]

  # GET /we_loves
  # GET /we_loves.json
  def index
    @we_loves = WeLofe.all
  end

  # GET /we_loves/1
  # GET /we_loves/1.json
  def show
  end

  # GET /we_loves/new
  def new
    @we_love = WeLofe.new
  end

  # GET /we_loves/1/edit
  def edit
  end

  # POST /we_loves
  # POST /we_loves.json
  def create
    @we_love = WeLofe.new(we_love_params)

    respond_to do |format|
      if @we_love.save
        format.html { redirect_to @we_love, notice: 'We lofe was successfully created.' }
        format.json { render :show, status: :created, location: @we_love }
      else
        format.html { render :new }
        format.json { render json: @we_love.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /we_loves/1
  # PATCH/PUT /we_loves/1.json
  def update
    respond_to do |format|
      if @we_love.update(we_love_params)
        format.html { redirect_to @we_love, notice: 'We lofe was successfully updated.' }
        format.json { render :show, status: :ok, location: @we_love }
      else
        format.html { render :edit }
        format.json { render json: @we_love.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /we_loves/1
  # DELETE /we_loves/1.json
  def destroy
    @we_love.destroy
    respond_to do |format|
      format.html { redirect_to we_loves_url, notice: 'We lofe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_we_love
      @we_love = WeLofe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def we_love_params
      params.require(:we_love).permit(:description, :tour_id)
    end
end
