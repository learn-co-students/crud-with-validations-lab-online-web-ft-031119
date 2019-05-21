class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validate :valid_release_year?
  validates :artist_name, presence: true

  def valid_release_year?
    return true unless released

    year = release_year.to_i
    if year.zero?
      errors.add(:release_year, 'must be number')
    elsif year > Date.today.year
      errors.add(:release_year, 'must be in the past')
    end
  end
end
