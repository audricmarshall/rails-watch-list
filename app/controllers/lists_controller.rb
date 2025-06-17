# list controller
class ListsController < ApplicationController
  # affiche toutes les listes

  def index
    @lists = List.all
  end

  # affiche les détails d'une list

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  # affiche le formu pour créer une nouvelle liste

  def new
    @list = List.new
  end

  # crée une nouvelle liste en base à partir du form

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # strong params pour la création d'une liste (sécurité Rails)
  def list_params
    params.require(:list).permit(:name)
  end
end
