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

  # def show
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list), status: :see_other

    # respond_to do |format|
    #   format.html { redirect_to lists_path, notice: "" }
    #   format.json { head :no_content }
    # end
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:movie_id, :comment)
    end
end
