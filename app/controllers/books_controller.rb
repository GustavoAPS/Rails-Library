class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    
    def index
        @books = Book.all
    end
    
    def show
        
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(whitelist_book_params)
        if @book.save
          flash[:notice] = "Book created sucessfully."
          redirect_to book_path(@book)
        else
            render 'new'
        end
    end

    def edit #will handle finding the article and displaing the form Get
        
    end

    def update # impact the table Post
        
        if @book.update(whitelist_book_params)
          flash[:notice] = "Book updated sucessfully."
          redirect_to book_path(@book)
        else
            render 'edit'
        end
    end

    def destroy
        
        @book.destroy
        redirect_to books_path
    end

    private
    def set_book
        @book = Book.find(params[:id])
    end

    def whitelist_book_params
        params.require(:book).permit(:title, :author, :description)
    end

end