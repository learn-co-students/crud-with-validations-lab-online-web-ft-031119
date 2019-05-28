class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "should happen once per year" }
  validate :invalid_without_release_year, :invalid_if_release_year_is_in_future

  def invalid_without_release_year
    if released && !release_year
      errors.add(:release_year, "must be present if released is true")
    end
  end

  def invalid_if_release_year_is_in_future
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def invalid_if_twice_in_year

  end


end
