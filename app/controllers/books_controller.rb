class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.order(id: :desc)
  end

  def show
  rescue ActiveRecord::RecordNotFound
    render file: Rails.root.join("public", "404.html"), status: 404, layout: false
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "刪除成功"
  end

  private
  def book_params
    params.require(:book).permit(:bookname, :description, :price, :page)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
