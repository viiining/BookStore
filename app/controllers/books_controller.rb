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
      redirect_to books_path, notice: "書籍新增成功"
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    book_params = params.require(:book).permit(:bookname, :description, :price, :page)
    if @book.update(book_params)
      redirect_to books_path, notice: "文章更新成功"
    else
      render :edit
    end
  end

end
