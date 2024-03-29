# frozen_string_literal: true

class SearchFacade
  def initialize(params)
    @type = params[:type]
    @movie_id = params[:id]
    @title = params[:title]
  end

  def movies
    if @type == 'top_rated'
      search_top_movies
    else
      movies_search
    end
  end

  def search_top_movies
    movies = MovieService.top_movies
    movies[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def movies_search
    if @title.nil?
      movie = MovieService.movie_search(@movie_id)
      cast = MovieService.cast_search(@movie_id)
      reviews = MovieService.reviews_search(@movie_id)
      @movie = Movie.new(movie, cast, reviews)
    else
      movies = MovieService.movies_search(@title)
      movies[:results].map do |movie|
        Movie.new(movie)
      end
    end
  end
end

