require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:attributes) do
    {
      title: "Dustwing",
      released: false,
      artist_name: "Shifty",
      genre: "Dragoncore"
    }
  end
  let(:missing_title) {attributes.except(:title)}
  let(:was_released) {attributes.except(:released)}
  let(:invalid_release_year) {attributes.merge(release_year: 2020, released: true)}
  let(:valid_release_year) {attributes.merge(release_year: 2016, released: true)}


  # it "is considered valid" do
  #   expect(Song.new(attributes)).to be_valid
  # end

  it "is invalid without title" do
    expect(Song.new(missing_title)).not_to be_valid
  end

  it "is valid if released before 2019" do
    expect(Song.new(valid_release_year)).to be_valid
  end

  it "is invalid if released after 2019" do
    expect(Song.new(invalid_release_year)).not_to be_valid
  end
end
