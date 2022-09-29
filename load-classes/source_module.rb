module Sources
  def list_sources
    puts ''
    puts 'List of all sources:'
    puts ''
    if @sources.empty?
      puts 'No sources recorded yet.'
      return
    end
    @sources.each do |source|
      puts "Source: #{source.name}"
    end
    puts ''
  end

  def save_sources
    source_hash = []
    @sources.each do |source|
      source_hash << {
        name: source.name,
        id: source.id
      }
    end
    File.open('./db/sources.json', 'w') { |f| f.puts source_hash.to_json }
  end

  def load_sources
    source_file = File.exist?('./db/source.json') ? File.read('./db/source.json') : '[]'
    sources_h = JSON.parse(source_file)
    sources_h.each do |source|
      source_new = Source.new(source['name'])
      @sources << source_new
    end
  end
end
