require_relative '../load-classes/list_options'
require_relative '../load-classes/authors_module'
require_relative '../load-classes/games_module'
require_relative '../load-classes/books_module'
require_relative '../load-classes/labels_module'
require_relative '../load-classes/movies_module'
require_relative '../load-classes/source_module'
require_relative '../load-classes/genres_module'
require_relative '../load-classes/music_album_module'
require './classes/author'
require './classes/label'
require './classes/source'
require './classes/genre'
require './classes/book'
require './classes/movie'
require './classes/music_album'
require './classes/game'
require_relative '../load-classes/properties'
require 'date'
require 'json'

class Catalog
  include Options
  include Authors
  include Games
  include BookModule
  include LabelModule
  include Movies
  include Sources
  include Genres
  include MusicAlbums
  include Properties
  attr_reader :books, :music_albums, :movies, :games
  def initialize
    @books = []
    @music_albums = []
    @movies = []
    @games = []
    @labels = []
    @sources = []
    @genres = []
    @authors = []
    @labels = []
    load_game
    load_authors
    load_movies
    load_sources
    load_album
    load_genre
    load_books
    load_labels
  end
  def act_regarding_input
    loop do
      Options.options
      choice = gets.to_i
      if choice == 13
        save_authors
        save_games
        save_movies
        save_sources
        save_album
        save_genre
        save_books
        save_labels
        puts 'Thanks You for using this app!'
        break
      end
      operation1(choice)
    end
  end
  def operation1(input)
    case input
    when 1
      list_books
    when 2
      list_music_albums
    else
      operation4(input)
    end
  end
  def operation4(input)
    case input
    when 3
      list_movie
    when 4
      list_games
    else
      operation2(input)
    end
  end
  def operation2(input)
    case input
    when 5
      list_genres
    when 6
      read_labels
    when 7
      list_authors
    when 8
      list_sources
    else
      operation3(input)
    end
  end
  def operation3(input)
    case input
    when 9
      add_book
    when 10
      add_music_album
    when 11
      add_movie
    when 12
      add_game
    else
      puts 'Your input is incorrect. Please enter a number between 1 and 13.'
    end
  end
end