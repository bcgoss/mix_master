class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
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
      @errors = @song.errors.full_messages.join(", ")
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
  end

  def edit
  end

  def update
    if @song.update_attributes(song_params)
      redirect_to song_path(@song)
    else
      redirect_to :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to :back
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title)
  end
end
