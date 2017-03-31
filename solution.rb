class Viewer
  attr_accessor :first_name, :last_name

    ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
      all.find do |viewer|
        viewer.full_name == name
      end
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end
end

class Rating
  attr_accessor :score, :viewer, :movie

    ALL = []

  def initialize(score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    ALL << self
  end

  def self.all
    ALL
  end

  def viewer
    self.Viewer.all.find_by_name(name)
  end

  def movie
    self.Movie.all.find_by_name(title)
  end
end


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
