class BooksController < ApplicationController
  def index
    @books = Book.order(id: :desc)
  end

  def show
    find_book
  rescue ActiveRecord::RecordNotFound
    render file: Rails.root.join("public", "404.html"), status: 404, layout: false
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:bookname, :description, :price, :page)
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    find_book
  end

  def update
    find_book

    book_params = params.require(:book).permit(:bookname, :description, :price, :page)
    if @book.update(book_params)
      redirect_to books_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    find_book
    @book.destroy
    redirect_to books_path, notice: "刪除成功"
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end
end
