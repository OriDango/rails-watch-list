class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:title, :movie_id)
    end
end
