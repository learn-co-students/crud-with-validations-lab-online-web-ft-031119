class Song < ApplicationRecord
  validates :title, :released, :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "Should happen once a year"}
  validates :release_year, presence: {if: :released?}
  validates :release_year, inclusion: 1970..2019
end
