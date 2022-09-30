module BookModule
  def list_books
    puts 'Book list is empty!' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index}) #{book.title} by #{book.author} #{book.publish_date} #{book.publisher} #{book.cover_state}"
    end
  end

  def add_book
    puts 'Please enter the publisher of the book:'
    publisher = gets.chomp
    puts 'Please enter the cover state of the book:'
    cover_state = gets.chomp
    puts 'Please enter the publish date of the book:'
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    add_properties(book)
    puts 'Book created successfully!'
  end

  def save_books
    book_hash = []
    @books.each do |book|
      book_hash << {
        publisher: book.publisher,
        id: book.id,
        cover_state: book.cover_state,
        publish_date: book.publish_date,
        author_first_name: book.author.first_name,
        author_last_name: book.author.last_name,
        label_title: book.label.title,
        label_color: book.label.color,
        genre: book.genre.name,
        source: book.source.name
      }
    end
    File.open('./db/books.json', 'w') { |f| f.puts book_hash.to_json }
  end

  def load_books
    book_file = File.exist?('./db/books.json') ? File.read('./db/books.json') : '[]'
    book_h = JSON.parse(book_file)
    book_h.each do |book|
      book_new = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      load_properties(book, book_new)
      @books << book_new
    end
  end
end
