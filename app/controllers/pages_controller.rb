class PagesController < ApplicationController
  before_filter :load_page, :only => [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.xml
  def index
    @pages = Page.all
    respond_with(@pages)
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_with(@page)
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new
    respond_with(@page)
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    @page.save
    respond_with(@page)
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page.update_attributes(params[:page])
    respond_with(@page)
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page.destroy
    respond_with(@page)
  end

  protected

  def load_page
    @page = Page.find_by_url(params[:id])
  end
end
