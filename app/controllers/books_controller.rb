class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    books = Book.new(book_params)
    respond_to do |format|
      if books.save
        format.html{redirect_to books, notice: 'Book was successfully created.'}
        format.json { render :show, status: :created, location: books }
    else
       format.html { render :new }
       format.json { render json: books.errors, status: :unprocessable_entity }
    end
   end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @edit_book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
    
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
