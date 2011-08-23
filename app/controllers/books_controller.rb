class BooksController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  # GET /books
  # GET /books.xml
  def index
    @books = Book.all
    respond_with(@books)
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    @book = Book.find(params[:id])
    respond_with(@book)
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new
    respond_with(@book)
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    @book.save
    respond_with(@book)
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    respond_with(@book)
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_with(@book)
  end
end
