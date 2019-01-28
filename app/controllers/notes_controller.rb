class NotesController < ApplicationController

  # before_action :move_to_index,except: :index

  def index
    @notes = Note.all
    if params[:id].present?
      @note = Note.find(params[:id])
    else
      @note = Note.new
    end
  end

  def create
    Note.create(memo_params)
    redirect_to action: :index
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to action: :index
  end

  def update
    @note = Note.find(params[:id])
    @note.update(memo_params)
    redirect_to action: :index
  end

  private
  def memo_params
    params.require(:note).permit(:title,:text,:tag_list)
  end

  def move_to_index
    redirect_to action: :index
  end

end
