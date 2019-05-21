class Song < ApplicationRecord

	validates :title, :artist_name, presence: true
	# validates :released, inclusion: { in: [true, false]}

	#  with_options if: :released? do |song|
	#     song.validates :release_year, presence: true
	# end

	
 
	#   def released?
	#     released 
	#   end
	

end
