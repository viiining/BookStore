class BooksController < ApplicationController
  def index
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:bookname, :description, :price, :page)
    @book = Book.new(book_params)

    if @book.save
      redirect_to "/books", notice: "書籍新增成功"
    else
      render :new
    end
  end

end
