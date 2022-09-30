module Properties
  def define_author
    print 'Author first name:'
    first_name = gets.chomp
    print 'Author last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end

  def define_label
    print 'Label title:'
    label_title = gets.chomp
    print 'Label color:'
    label_color = gets.chomp
    label = Label.new(label_title, label_color)
    @labels << label
    label
  end

  def define_genre
    print 'Genre:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    genre
  end

  def define_source
    print 'Source name:'
    name = gets.chomp
    source = Source.new(name)
    @sources << source
    source
  end

  def load_properties(item, item_new)
    author = Author.new(item['author_first_name'], item['author_last_name'])
    source = Source.new(item['source'])
    genre = Genre.new(item['genre'])
    label = Label.new(item['label_title'], item['label_color'])
    item_new.add_author(author)
    item_new.add_source(source)
    item_new.add_genre(genre)
    item_new.add_label(label)
    @labels << label
    @authors << author
    @genres << genre
    @sources << source
  end

  def add_properties(item)
    p "Add author for this #{item.class}:"
    item.add_author(define_author)
    p "Add label for this #{item.class}:"
    item.add_label(define_label)
    item.add_genre(define_genre)
    item.add_source(define_source)
  end
end
