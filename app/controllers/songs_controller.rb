class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def new 
		@song = Song.new
	end

	def create
		@song = Song.new(song_params)
		# binding.pry
		if @song.valid? 
			@song.save
			redirect_to song_path(@song)
		else
			render :new
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

	    @song.update(song_params)

	      if @song.valid?

	      redirect_to song_path(@song)

	      else

	      render :edit
    end

    def destroy
    	@song = Song.find(params[:id])
    	@song.destroy

    	redirect_to songs_path
    end
  end

	private

	def song_params
		 params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
	end
end
