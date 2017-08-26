class NotesController < ApplicationController
  def index
    @notes = Note.where('user_id = "#{current_user.id}"')
  end

  def show
    @note = Note.find(params[:id])
    if @note.user_id != current_user.id
      redirect_to bands_url
    else
      render :show
    end
  end

  def new
    render :new
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to track_path(notes_params[:track_id])
    else
      render :new
    end
  end

  def destroy
    @note = Note.find(params[:id])
    track = @note.track_id
    if @note.user_id != current_user.id
      redirect_to bands_url
    else
      @note.destroy
    end
    redirect_to track_url(track)
  end

  private
  def notes_params
    params.require(:note).permit(:user_id, :track_id, :text_note)
  end
end
