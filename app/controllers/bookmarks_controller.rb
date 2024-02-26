class BookmarksController < ApplicationController

  def index
    @book = Bookmark.all
  end

  def new
    @book = Bookmark.new
  end

  def create
    @book = Bookmark.new(bookmark_params)

      if @book.save
        redirect_to book_url(@book), notice: "bookmark was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @book = Bookmark.find(params[:id])
  end

  private

    def restaurant_params
      params.require(:bookmarks).permit(:title, :movie_id, :list_id)
    end
end
