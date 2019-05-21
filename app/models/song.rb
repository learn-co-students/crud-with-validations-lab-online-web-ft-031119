class Song < ApplicationRecord

	validates :title, :artist_name, presence: true
	validates :release_year, presence: true, if: :released?
 
	  def released?
	    released == true
	  end
	

end
