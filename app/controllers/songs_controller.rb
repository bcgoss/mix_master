class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      flash[:notice] = @song.errors.full_messages.join(", ")
      redirect_to new_artist_song_path(@artist)
    end
  end

  def index
    if params[:artist_id]
      @songs = Artist.find(params[:artist_id]).songs
    else
      @songs = Song.all
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
      redirect_to song_path(@song)
    else
      flash[:notice] = @song.errors.full_messages.join(", ")
      redirect_to edit_song_path(@song)
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to :back
  end

  private
  def song_params
    params.require(:song).permit(:title)
  end
end
