module Movies
  def add_movie
    print 'Movie name: '
    name = gets.chomp
    print 'Published date: '
    publish_date = gets.chomp
    print 'Movie is silent? [Y/N]'
    silent = gets.chomp.upcase
    case silent
    when 'Y'
      silent = true
    when 'N'
      silent = false
    else
      puts 'Invalid option \n'
    end
    movie = Movie.new(name, publish_date, silent)
    @movies << movie
    add_properties(movie)
    puts 'Movie Added successfully'
  end

  def list_movie
    puts 'List of all movie:'
    puts 'No movie recorded yet.' if @movies.empty?
    @movies.each do |movie|
      puts "movie name: #{movie.name},\nPublished date: #{movie.publish_date},\nsilent #{movie.silent}\n\n"
    end
  end

  def load_movies
    movie_file = File.exist?('./db/movies.json') ? File.read('./db/movies.json') : '[]'
    movie_h = JSON.parse(movie_file)
    movie_h.each do |movie|
      movie_new = Movie.new(movie['name'], movie['publish_date'], movie['silent'])
      load_properties(movie, movie_new)
      @movies << movie_new
    end
  end

  def save_movies
    movies_hash = []
    @movies.each do |mov|
      movies_hash << {
        name: mov.name,
        publish_date: mov.publish_date,
        silent: mov.silent,
        author_first_name: mov.author.first_name,
        author_last_name: mov.author.last_name,
        label_title: mov.label.title,
        label_color: mov.label.color,
        genre: mov.genre.name,
        source: mov.source.name
      }
    end
    File.open('./db/movies.json', 'w') { |f| f.puts movies_hash.to_json }
  end
end
