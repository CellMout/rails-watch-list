class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(comment: params[:bookmark][:comment])
    @bookmark.movie_id = params[:bookmark][:movie_id]
    @bookmark.list_id = params[:list_id]
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
