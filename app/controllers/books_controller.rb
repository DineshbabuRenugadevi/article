class BooksController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index, :listindex]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
        
        respond_to do |format|
            format.html {}
            format.js {}
        end
    end

    def listindex
        @books = Book.paginate(page: params[:page], per_page: 5)
    end

    def index
        @books = Book.paginate(page: params[:page], per_page: 5)
    end
    

    def new
        @book = Book.new
    end

    def edit
       
    end

    def create
       @book = Book.new(params.require(:book).permit(:title, :description, :price, :count, :user))
       @book.user = current_user
      if  @book.save
        flash[:notice] = "Books was Created Successfully."
       redirect_to @book
      else
        render "new"
      end
    end

    def update
        
        if @book.update(params.require(:book).permit(:title, :description, :price, :count))
            flash[:notice] = "Books was Updated Successfully"
            redirect_to @book
        else
            render "edit"
        end

    end

    def destroy
        
        @book.destroy
        flash[:notice] = "Your books has been deleted Successfully"
        redirect_to  books_path 

    end

    private

        def set_article
            @book = Book.find(params[:id])
        end
    
        def require_same_user
            if current_user != @book.user && !current_user.admin?
              flash[:alert] = "You can edit or delete your own article"
              redirect_to @book
            end
        end


end