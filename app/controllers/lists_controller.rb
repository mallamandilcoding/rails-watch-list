class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    # raise
   @list = List.new(list_param)
   if @list.save
    redirect_to lists_path
   else
    render :new,status: :unprocessable_entity
   end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    # raise
  end

  def list_param
    params.require(:list).permit(:name, :photo)
  end
end
