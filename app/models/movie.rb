
class Movie
  attr_accessor :title

    ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    all.find do |movie|
      movie.title == self
    end
  end

  def ratings
    self.Rating.all
  end

  def viewers
    self.Viewer.all
  end

  def average_rating
    total_rating = 0
    self.rating.all.each do |score|
      score += total_rating
    end
      total_rating / rating.all.size
  end
end
