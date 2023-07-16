class BooksController < ApplicationController
  def index
    @books = Book.order(id: :desc)
  end

  def show
      @book = Book.find(params[:id])
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
      redirect_to "/books", notice: "書籍新增成功"
    else
      render :new
    end
  end

end
