module Authors
    def list_authors
      puts 'Author list is empty! Add an author please.' if @authors.empty?
      @authors.each_with_index do |author, index|
        p "#{index}) #{author.first_name} #{author.last_name}"
      end
    end
    def save_authors
      author_details = []
      return if @authors.nil?
      @authors.each do |author|
        author_details << { first_name: author.first_name, last_name: author.last_name, id: author.id, items: author.items }
      end
      File.open('./db/authors.json', 'w') { |f| f.puts author_details.to_json }
    end
    def load_authors
      author_file = File.exist?('./db/authors.json') ? File.read('./db/authors.json') : '[]'
      author_hash = JSON.parse(author_file)
      author_hash.each do |author|
        @authors << Author.new(author['first_name'], author['last_name'])
      end
    end
  end