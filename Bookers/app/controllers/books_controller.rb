class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user
  end

  def new
  end

  def show
    @books = Book.find(params[:id])
  	@book = Book.new
  end

  def edit
  	  @book = Book.find(params[:id])
      if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
  	@book = Book.find(params[:id])

    if @book.update(book_params)
    	flash[:notice] = "Book was successfully edited."
    redirect_to @book
     else
     render :edit, status: :unprocessable_entity
   end
  end

  def destroy
  	  @book = Book.find(params[:id])
  	  @book.destroy
      redirect_to books_path
  end

  def create
  	 @book = Book.new(book_params)
  	 @book.user_id = current_user.id
     if @book.save
     	flash[:notice] = "Book was successfully created."
     redirect_to @book
     else
     	@books= Book.all
     	render "index"

     end
  end

private
    def book_params
      params.require(:book).permit(:title, :body)
    end



end