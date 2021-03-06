class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
         flash[:notice] = "You have creatad book successfully."
         redirect_to book_path(@book.id)
      else
           @books = Book.all
           @user = current_user
           render :index
           flash[:notice] = "error"
      end
      end


  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = current_user

  end

  def edit
    @book =Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
         flash[:notice] = "You have creatad book successfully."
         redirect_to book_path(@book)
      else
        redirect_to book_path(@book.id)
        flash[:notice] = "error"
      end
      end

  def destroy
    @books = Book.find(params[:id])
     @books.destroy
      redirect_to books_path
  end



  private

    def book_params
      params.require(:book).permit(:title, :body,:user_id)
    end

    def correct_user
    @book = Book.find(params[:id])
    if @book.user_id!=current_user.id
      redirect_to books_path
    end
  end
end
