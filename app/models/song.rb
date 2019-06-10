class Song < ApplicationRecord
  validates :title, :artist_name, :genre, presence: true

  validates_uniqueness_of :title, scope: [:artist_name, :release_year]

  validates :released, inclusion: {
    in: [true, false],
    message: "%{value} is not a valid boolean."
  }
  
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Time.current.year} 

end
