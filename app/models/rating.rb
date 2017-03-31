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
