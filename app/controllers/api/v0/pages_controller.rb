module Api::V0
  class PagesController < ApplicationController
    before_action :set_page, only: [:show]

    # GET /pages
    def index
      @pages = Page.all

      render json: @pages
    end

    # GET /pages/1
    def show
      render json: @page
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.scrap
        puts @page
        render json: @page, status: :created
      else
        render json: @page.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def page_params
        params.require(:page).permit(:page_url)
      end
  end
end
