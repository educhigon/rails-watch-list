class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new(list_params)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    @bookmark.list_id = params[:list_id]
    done = @bookmark.save
    if done
      redirect_to list_path(params[:list_id])
    else
      render :new
    end
  end

  def destroy
    del = Bookmark.find(params[:id])
    del.destroy
    redirect_to list_path(del[:list_id])
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
