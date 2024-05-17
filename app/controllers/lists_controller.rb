class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = Bookmark.where(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    done = @list.save
    if done
      redirect_to list_path(@list)
    else
      render :new
    end

  end

  def destroy
    del = List.find(params[:id])
    del.destroy
    redirect_to lists_path
  end


  private


  def list_params
    params.require(:list).permit(:name)
  end


end
