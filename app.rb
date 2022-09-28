require 'io/console'
require_relative './helper'

class App
  attr_reader :genres, :sources
  attr_accessor :albums, :books

  include BookHandle
  include MusicAlbumHandle
  include StaticDataHandle
  include MovieHandle
  include GamesHandle
  include ReadData
  include WriteData

  def initialize
    @books = []
    read_books

    @albums = []
    read_music_album

    @games = []
    read_games

    @movies = []
    read_movies

    @genres = []
    read_genre

    @sources = []
    read_source

    @authors = []
    read_authors

    @labels = []
    read_labels
  end

  def menu
    puts 'Welcome To the Catalog of things'
    puts
    puts 'Please enter option number 1 - 11 to begin'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Exit'
  end

  def selected(choice)
    case choice
    when 1
      puts
      list_books
    when 2
      puts
      list_music_album
    when 3
      puts
      list_movies
    when 4
      puts
      list_games
    when 5
      puts
      list_genres
    when 6
      puts
      list_labels
    when 7
      puts
      list_authors
    when 8
      puts
      list_sources
    when 9
      puts
      create_book
      write_books
    when 10
      puts
      create_music_album
      write_music_albums
    when 11
      puts
      create_movie
      write_movies
    when 12
      puts
      create_game
      write_games
    when 13
      puts 'Thanks For Using Our Program =(MYZ Team)='
      exit
    else
      puts 'Invalid option'
    end
  end

  def run
    choice = 0
    while choice != 13
      menu
      puts
      print 'Please choose an option by entering a number:=> '
      choice = gets.chomp.strip.to_i
      selected(choice)
      print 'Press any key to continue....'
      $stdin.getch
    end
  end
end
