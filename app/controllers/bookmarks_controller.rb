# bookmark controller
class BookmarksController < ApplicationController
  # affiche le formulaire pour créer un nouveau bookmarks dans une liste

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # crée un bookmark pour un film donné dans une liste

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Successfully added!'
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  # supprime un bookmark et redirige vers la list

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  # strong params pour créer un brookmark (commentaire + id du film)
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
