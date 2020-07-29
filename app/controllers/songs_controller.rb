class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
        #binding.pry
    end

    def create
        @song = Song.new(song_params)
        #binding.pry
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song2 = Song.new(song_params)
        @song = Song.find(params[:id])
        #binding.pry
        if @song.update(song_params)
          
          redirect_to song_path(@song)
        else
          render :edit
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre, :id)
    end
end