class PagesController < ApplicationController
	before_action :set_page, only: [:edit, :update, :destroy]
	def index
	end

	def show
	end

	# GET /pages/new
	def new
	@page = Page.new
	end

	# GET /pages/1/edit
	def edit
	end

	# POST /pages
	# POST /pages.json
	def create
	@page = Page.new(page_params)
	respond_to do |format|
	  if @page.save
	    format.html { redirect_to @page}
	    format.json { render :show, status: :created, location: @page }
	  else
	    format.html { render :new }
	    format.json { render json: @page.errors, status: :unprocessable_entity }
	  end
	end
	end

	# PATCH/PUT /pages/1
	# PATCH/PUT /pages/1.json
	def update
	respond_to do |format|
	  if @page.update(tour_params)
	    format.html { redirect_to pages_url}
	    format.json { render :show, status: :ok, location: @page }
	  else
	    format.html { render :edit }
	    format.json { render json: @page.errors, status: :unprocessable_entity }
	  end
	end
	end

	# DELETE /pages/1
	# DELETE /pages/1.json
	def destroy
	@page.destroy
	respond_to do |format|
	  format.html { redirect_to pages_url}
	  format.json { head :no_content }
	end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_page
	  @page = Page.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def page_params
	  params.require(:page).permit(:name, :permalink, :content)
	end
end
